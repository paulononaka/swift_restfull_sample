import UIKit

protocol UserDetailEditTableViewControllerDelegate{
    func UserDetailEditTableViewControllerCellTextDesc(desc: String)
    func UserDetailEditTableViewControllerCellTextName(name: String)
    func UserDetailEditTableViewControllerCellTextEmail(email: String)
}

class UserDetailEditTableViewController: UITableViewController, CellTextTableViewCellDelegate, CellInfoTableViewCellDelegate {
    
    var user: User!
    var delegate: UserDetailEditTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func receiveUser(user: User){
        self.user = user
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch(indexPath.row){
        case 0:
            return cellPhoto(tableView, indexPath: indexPath)
        case 1:
            return cellName(tableView, indexPath: indexPath)
        case 2:
            return cellEmail(tableView, indexPath: indexPath)
        default:
            return cellDesc(tableView, indexPath: indexPath)
        }
    }
    
    func cellPhoto(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cellPhotoTableViewCell", forIndexPath: indexPath) as! CellPhotoTableViewCell
        cell.receiveUrl(user.photo_url)
        return cell
    }
    
    func cellName(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cellInfoTableViewCell", forIndexPath: indexPath) as! CellInfoTableViewCell
        cell.labelTitle.text = "Name"
        cell.textFiel.text = user.name
        cell.nameField = "name"
        cell.delegate = self
        return cell
    }
    
    func cellEmail(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cellInfoTableViewCell", forIndexPath: indexPath) as! CellInfoTableViewCell
        cell.labelTitle.text = "E-mail"
        cell.textFiel.text = user.email
        cell.textFiel.keyboardType = UIKeyboardType.EmailAddress
        cell.nameField = "email"
        cell.delegate = self
        return cell
    }
    
    func cellDesc(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cellTextTableViewCell", forIndexPath: indexPath) as! CellTextTableViewCell
        cell.labelTitle.text = "Description"
        cell.textViewDesc.text = user.description
        cell.delegate = self
        return cell
    }
    
    // MARK: - delegate Cells
    
    func CellTextTableViewCellDesc(desc: String) {
        delegate?.UserDetailEditTableViewControllerCellTextDesc(desc)
    }
    
    func CellInfoTableViewCellEmail(email: String) {
        delegate?.UserDetailEditTableViewControllerCellTextEmail(email)
    }
    
    func CellInfoTableViewCellName(name: String) {
        delegate?.UserDetailEditTableViewControllerCellTextName(name)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch(indexPath.row){
        case 0:
            return 194
        case 1:
            return 44
        case 2:
            return 44
        case 3:
            return 194
        default:
            return 44
        }
    }
}
