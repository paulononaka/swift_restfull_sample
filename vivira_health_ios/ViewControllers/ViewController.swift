import UIKit

class ViewController: UIViewController {
    
    let tableViewUsers = UsersTableViewController()
    @IBOutlet var buttonUserAdd: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User"
        addButtonSideRight(buttonUserAdd)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addButtonSideRight(button: UIBarButtonItem) {
        var array = [UIBarButtonItem]()
        array.append(button)
        self.navigationItem.rightBarButtonItems = array
    }

    @IBAction func touchAddButton(sender: AnyObject) {
        let screenDetail = FactoryStoryboard.storyboardHome().instantiateViewControllerWithIdentifier("userAddTableViewController") as? UserAddTableViewController
        self.navigationController?.pushViewController(screenDetail!, animated: true)
    }
}

