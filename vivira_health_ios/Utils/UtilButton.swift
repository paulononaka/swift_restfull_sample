
import UIKit

class UtilButton: NSObject {

    class func setDefaultCancelButton(button: UIButton) {
        button.setTitle("Cancel", forState: UIControlState.Normal)
        button.setTitle("Cancel", forState: UIControlState.Highlighted)
        button.setTitleColor(UtilColors.colorNavigationBar(), forState: UIControlState.Normal)
        button.setTitleColor(UtilColors.ColorWrite(), forState: UIControlState.Highlighted)
        button.setBackgroundImage(UIImage(named: "button_off"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "button_on"), forState: UIControlState.Highlighted)
    }
    
    class func setDefaultConfirmButton(button: UIButton) {
        button.setTitle("Confirm", forState: UIControlState.Normal)
        button.setTitle("Confirm", forState: UIControlState.Highlighted)
        button.setTitleColor(UtilColors.colorGrey1(), forState: UIControlState.Normal)
        button.setTitleColor(UtilColors.ColorWrite(), forState: UIControlState.Highlighted)
        button.setBackgroundImage(UIImage(named: "button_gray_off"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "button_gray_on"), forState: UIControlState.Highlighted)
    }
}
