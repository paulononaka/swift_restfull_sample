import UIKit
import SwiftLoader

class UtilViewController: NSObject {
    
    static let sharedInstance = UtilViewController()
    
    func showActivityIndicator(){
        showActivityIndicator("Searching...")
    }
    
    func showActivityIndicator(title: String, color: UIColor = UIColor.whiteColor()){
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 170
        config.backgroundColor = color.colorWithAlphaComponent(0.4)
        config.spinnerColor = UIColor.colorWithHexString(Constants.ColorsHex.INDICATOR)
        config.titleTextColor = UIColor.colorWithHexString(Constants.ColorsHex.INDICATOR)
        config.spinnerLineWidth = 2.0
        config.cornerRadius =  30
        SwiftLoader.setConfig(config)
        SwiftLoader.show(title: title, animated: true)
    }
    
    func hideActivityIndicator(){
        SwiftLoader.hide()
    }
    
    func showMessage(viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Vivira", message: "\(message)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
        viewController.presentViewController(alert, animated: true){}
    }
    
    func showMessage(viewController: UIViewController, message: String, okHandler:() -> Void) {
        let alert = UIAlertController(title: "Vivira", message: "\(message)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in okHandler() })
        viewController.presentViewController(alert, animated: true){}
    }

}
