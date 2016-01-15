import UIKit

class FactoryStoryboard: NSObject {
    
    class func storyboardHome() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}