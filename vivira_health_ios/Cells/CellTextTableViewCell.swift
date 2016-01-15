import UIKit

protocol CellTextTableViewCellDelegate{
    func CellTextTableViewCellDesc(desc: String)
}

class CellTextTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textViewDesc: UITextView!
    var delegate: CellTextTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textViewDesc.delegate = self
        self.textViewDesc?.inputAccessoryView = UtilKeyBoard.viewButtonControlWithConfirmTarget(self, methodConfirm: "keyBoardConfirm", titleConfirm: "Confirm", targetCancel: self, methodCancel: "keyBoardCancel", titleCancel: "Cancel", targetHideKeyboard: self, methodHideKeyboard: "turnOffField")
    }
    
    func keyBoardConfirm(){
        turnOffField()
        let text = self.textViewDesc.text
        delegate?.CellTextTableViewCellDesc(text)
    }
    
    func keyBoardCancel(){
        turnOffField()
        let text = self.textViewDesc.text
        delegate?.CellTextTableViewCellDesc(text)
    }
    
    func textViewDidChange(textView: UITextView) {
        let text = self.textViewDesc.text
        delegate?.CellTextTableViewCellDesc(text)
    }
    
    func turnOffField(){
        self.textViewDesc?.resignFirstResponder()
    }

}
