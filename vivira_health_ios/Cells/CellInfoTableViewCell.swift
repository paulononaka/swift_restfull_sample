import UIKit

protocol CellInfoTableViewCellDelegate{
    func CellInfoTableViewCellName(name: String)
    func CellInfoTableViewCellEmail(email: String)
 }

class CellInfoTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFiel: UITextField!
    var delegate: CellInfoTableViewCellDelegate?
    var nameField = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textFiel.delegate = self
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.textFiel?.resignFirstResponder()
        if nameField == "name"{
            delegate?.CellInfoTableViewCellName(textFiel.text!)
        }else{
            delegate?.CellInfoTableViewCellEmail(textFiel.text!)
        }
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if nameField == "name"{
            delegate?.CellInfoTableViewCellName(textFiel.text!)
        }else{
            delegate?.CellInfoTableViewCellEmail(textFiel.text!)
        }
        return true
    }
}
