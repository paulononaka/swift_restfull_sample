import UIKit

class UsersTableViewController: UITableViewController {
    
    var users: [User] = []
    var utilNetwork = UtilNetwork.sharedInstance
    var utilViewController = UtilViewController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        getUsers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userTableViewCell", forIndexPath: indexPath) as! UserTableViewCell
        let user = users[indexPath.row]
        cell.name.text = user.name
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let user = users[indexPath.row]
        getUserDetail(user)
    }
    
    // MARK: - Call Ws
    func getUsers() {
        if utilNetwork.isNetworkAvailable() {
            utilViewController.showActivityIndicator("Searching...")
            
            RestClient.getUsers() { result in
                self.utilViewController.hideActivityIndicator()
                if result.result.isFailure {
                    self.utilViewController.showMessage(self, message:"An error occurred. Please try again :(")
                } else {
                    self.users = result.result.value!.users
                    self.tableView.reloadData()
                }
            }
        } else {
            utilViewController.showMessage(self, message: "Network not available :(")
        }
    }
    
    func getUserDetail(user: User) {
        if utilNetwork.isNetworkAvailable() {
            utilViewController.showActivityIndicator("Searching...")
            
            RestClient.getUserDetail(user.id) { result in
                self.utilViewController.hideActivityIndicator()
                if result.result.isFailure {
                    self.utilViewController.showMessage(self, message: "An error occurred. Please try again :(")
                } else {
                    let screenDetail = FactoryStoryboard.storyboardHome().instantiateViewControllerWithIdentifier("userDetailViewController") as? UserDetailViewController
                    screenDetail?.user = result.result.value!.user
                    self.navigationController?.pushViewController(screenDetail!, animated: true)
                }
            }
        }
    }

}