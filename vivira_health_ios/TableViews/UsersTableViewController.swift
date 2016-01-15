import UIKit

class UsersTableViewController: UITableViewController {
    
    var users: [User] = []
    
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
    
    func getUsers() {
        RestClient.getUsers() { result in
            self.users = result.result.value!.users
            self.tableView.reloadData()
        }
    }

}