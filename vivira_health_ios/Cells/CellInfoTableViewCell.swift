import UIKit

protocol CellInfoTableViewCellDelegate{
    func CellInfoTableViewCellName(name: String)
    func CellInfoTableViewCellEmail(email: String)
 }

class CellInfoTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textField: UITextField!
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
        textField.delegate = self
        textField.addTarget(self, action: "didChangeText:", forControlEvents: .EditingChanged)
    }
    
    func didChangeText(textField:UITextField) {
        if nameField == "name"{
            delegate?.CellInfoTableViewCellName(textField.text!)
        }else{
            delegate?.CellInfoTableViewCellEmail(textField.text!)
        }
    }

}
