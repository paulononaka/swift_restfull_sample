
import UIKit

protocol UtilKeyboardDataSouce: NSObjectProtocol{
    func utilKeyboardViewThatWillBeAdjusted() -> UIView
    func utilKeiboardViewWhatIsUsedAsReferenceToCalculateAdjustmentRequired() -> UIView
}

class UtilKeyBoard: NSObject {
    
    var requiredShiftToSetKeyboard: CGPoint!
    var timeAnimationKeyboard: Double!
    var extraSpacingBetweenViewAndKeyboard: Int!
    
    var dataSource: UtilKeyboardDataSouce?
    
    class func viewButtonControlWithConfirmTarget(targetConfirm: AnyObject, methodConfirm: Selector, titleConfirm: String, targetCancel: AnyObject, methodCancel: Selector, titleCancel: String, targetHideKeyboard: AnyObject, methodHideKeyboard: Selector) -> UIView{
        
        let dimension: CGRect = UIScreen.mainScreen().bounds
        
        let viewHigher = UIView(frame: CGRectMake(0, 0, dimension.size.width, 44))
        viewHigher.backgroundColor = UtilColors.ColorWrite()
        
        let buttonHideKeyBoard:UIButton = UIButton(type: UIButtonType.Custom)
        buttonHideKeyBoard.frame = CGRectMake(15, 7, 40, 30)
        buttonHideKeyBoard.setImage(UIImage(named: "hide_keyboard"), forState: UIControlState.Normal)
        buttonHideKeyBoard.setImage(UIImage(named: "hide_keyboard_active"), forState: UIControlState.Highlighted)
        buttonHideKeyBoard.imageView?.contentMode = UIViewContentMode.Center
        buttonHideKeyBoard.addTarget(targetHideKeyboard, action: methodHideKeyboard, forControlEvents: UIControlEvents.TouchUpInside)
        
        let buttonCancel:UIButton = UIButton(type: UIButtonType.Custom)
        buttonCancel.frame = CGRectMake(63.5, 7, 113, 30)
        buttonCancel.addTarget(targetCancel, action: methodCancel, forControlEvents: UIControlEvents.TouchUpInside)
        UtilButton.setDefaultCancelButton(buttonCancel)
        buttonCancel.setTitle("Cancel", forState: UIControlState.Normal)
        buttonCancel.setTitle("Cancel", forState: UIControlState.Highlighted)
        
        let buttonConfirm:UIButton = UIButton(type: UIButtonType.Custom)
        buttonConfirm.frame = CGRectMake(188, 7, 113, 30)
        buttonConfirm.addTarget(targetConfirm, action: methodConfirm, forControlEvents: UIControlEvents.TouchUpInside)
        UtilButton.setDefaultConfirmButton(buttonConfirm)
        buttonConfirm.setTitle("Confirm", forState: UIControlState.Normal)
        buttonConfirm.setTitle("Confirm", forState: UIControlState.Highlighted)
        
        viewHigher.addSubview(buttonHideKeyBoard)
        viewHigher.addSubview(buttonCancel)
        viewHigher.addSubview(buttonConfirm)
        
        return viewHigher
    }
    
    override init() {
        super.init()
        self.extraSpacingBetweenViewAndKeyboard = 10
        self.registerKeyboardEvents()
    }
    
    func registerKeyboardEvents(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardAppeared:" , name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyboardDisappeared:" , name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func keyboardAppeared(notificacao: NSNotification){
        self.backScreenTheStateOriginal()
        let info: NSDictionary! = notificacao.userInfo
        let requiredShiftYAxis: CGFloat = 0
        self.requiredShiftToSetKeyboard = CGPointMake(0, requiredShiftYAxis)
        
        if self.requiredShiftToSetKeyboard.x != 0 || self.requiredShiftToSetKeyboard.y != 0{
            self.timeAnimationKeyboard = info.objectForKey(UIKeyboardAnimationDurationUserInfoKey)?.doubleValue
            UIView.animateWithDuration(self.timeAnimationKeyboard, animations: {
                let adjustView: UIView! = self.dataSource?.utilKeyboardViewThatWillBeAdjusted()
                adjustView?.frame = CGRectMake(adjustView.frame.origin.x + self.requiredShiftToSetKeyboard.x, adjustView.frame.origin.y + self.requiredShiftToSetKeyboard.y, adjustView.frame.size.width, adjustView.frame.size.height)
            })
        }
    }
    
    func keyboardDisappeared(notificacao: NSNotification){
        self.backScreenTheStateOriginal()
    }
    
    func backScreenTheStateOriginal(){
        if self.requiredShiftToSetKeyboard != nil{
            if self.requiredShiftToSetKeyboard.x != 0 || self.requiredShiftToSetKeyboard.y != 0{
                UIView.animateWithDuration(self.timeAnimationKeyboard, animations: {
                    let adjustView: UIView! = self.dataSource?.utilKeyboardViewThatWillBeAdjusted()
                    adjustView?.frame = CGRectMake(adjustView.frame.origin.x - self.requiredShiftToSetKeyboard.x, adjustView.frame.origin.y - self.requiredShiftToSetKeyboard.y, adjustView.frame.size.width, adjustView.frame.size.height)
                })
            }
        }
        self.requiredShiftToSetKeyboard = CGPointMake(0, 0)
    }
}
