import UIKit

class UserAddTableViewController: UITableViewController, CellTextTableViewCellDelegate, CellInfoTableViewCellDelegate {
    
    var user = User()
    var utilNetwork = UtilNetwork.sharedInstance
    var utilViewController = UtilViewController.sharedInstance
    @IBOutlet var buttonSave: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New user"
         self.navigationItem.rightBarButtonItem = buttonSave
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch(indexPath.row){
        case 0:
            return 44
        case 1:
            return 44
        default:
            return 194
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch(indexPath.row){
        case 0:
            return cellName(tableView, indexPath: indexPath)
        case 1:
            return cellEmail(tableView, indexPath: indexPath)
        default:
            return cellDesc(tableView, indexPath: indexPath)
        }
    }
    
    func cellName(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cellInfoTableViewCell", forIndexPath: indexPath) as! CellInfoTableViewCell
        cell.labelTitle.text = "Name"
        cell.textField.text = user.name
        cell.nameField = "name"
        cell.delegate = self
        return cell
    }
    
    func cellEmail(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cellInfoTableViewCell", forIndexPath: indexPath) as! CellInfoTableViewCell
        cell.labelTitle.text = "E-mail"
        cell.textField.text = user.email
        cell.nameField = "email"
        cell.delegate = self
        cell.textField.keyboardType = UIKeyboardType.EmailAddress
        return cell
    }
    
    func cellDesc(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cellTextTableViewCell", forIndexPath: indexPath) as! CellTextTableViewCell
        cell.labelTitle.text = "Description"
        cell.textViewDesc.text = user.description
        cell.delegate = self
        return cell
    }
    
    // MARK: - Delegates cells
    
    func CellTextTableViewCellDesc(desc: String) {
        user.description = desc
    }
    
    func CellInfoTableViewCellName(name: String) {
        user.name = name
    }
    
    func CellInfoTableViewCellEmail(email: String) {
        user.email = email
    }
    
    @IBAction func touchButtonAdd(sender: AnyObject) {
        postCreateUser(user)
    }
    
    func postCreateUser(user: User) {
        if utilNetwork.isNetworkAvailable() {
            if (!user.name.isEmpty && !user.email.isEmpty && !user.description.isEmpty) {
                utilViewController.showActivityIndicator("Saving new user...")
                RestClient.postCreateUser(user) { result in

                    self.utilViewController.hideActivityIndicator()
                    
                    if result.result.isFailure ||
                        result.response?.statusCode < 200 ||
                        result.response?.statusCode >= 300
                    {
                        self.utilViewController.showMessage(self, message: "An error occurred. Please try again :(")
                    } else {
                        self.utilViewController.showMessage(self, message: "New user created with success!", okHandler: {
                            self.navigationController?.popToRootViewControllerAnimated(true)
                        })
                    }
                }
            } else {
                utilViewController.showMessage(self, message: "Please fill the field :)")
            }
        } else {
            utilViewController.showMessage(self, message: "Network not available :(")
        }
    }
}
