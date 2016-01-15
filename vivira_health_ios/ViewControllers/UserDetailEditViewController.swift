
import UIKit

class UserDetailEditViewController: UIViewController, UserDetailEditTableViewControllerDelegate{
    
    @IBOutlet var buttonSave: UIBarButtonItem!
    var tableDetail = UserDetailEditTableViewController()
    var user: User!
    var utilNetwork = UtilNetwork.sharedInstance
    var utilViewController = UtilViewController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        addButtonSideRight(buttonSave)
    }
    
    func addButtonSideRight(button: UIBarButtonItem) {
        var array = [UIBarButtonItem]()
        array.append(button)
        self.navigationItem.rightBarButtonItems = array
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(UserDetailEditTableViewController){
            self.tableDetail = segue.destinationViewController as! (UserDetailEditTableViewController)
            self.tableDetail.user = user
            self.tableDetail.delegate = self
        }
    }
    
    @IBAction func touchButtonSave(sender: AnyObject) {
        putEditUser(user)
    }
    
    func putEditUser(user: User) {
        if utilNetwork.isNetworkAvailable() {
            utilViewController.showActivityIndicator("Update user...")
            RestClient.putEditUser(user) { result in
                self.utilViewController.hideActivityIndicator()
                if result.result.isFailure {
                    self.utilViewController.showMessage(self, message: "An error occurred. Please try again :(")
                } else {
                    self.utilViewController.showMessage(self, message: "User edited with success!", okHandler: {
                        self.navigationController?.popToRootViewControllerAnimated(true)
                    })
                }
            }
        } else {
            utilViewController.showMessage(self, message: "Network not available :(")
        }
    }
    
    // MARK: - Delegate table
    func UserDetailEditTableViewControllerCellTextDesc(desc: String) {
        user.description = desc
    }
    
    func UserDetailEditTableViewControllerCellTextEmail(email: String) {
        user.email = email
    }
    
    func UserDetailEditTableViewControllerCellTextName(name: String) {
        user.name = name
    }
}
