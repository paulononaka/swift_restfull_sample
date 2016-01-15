import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setsBackgroundOfColorNavigationBar()
        setsBackgroundOfColorButtonNavigationBar()
        setsStyleTitleNavigationBar()
        return true
    }
    
    func setsBackgroundOfColorNavigationBar() {
        UINavigationBar.appearance().barTintColor = UIColor.colorWithHexString(Constants.ColorsHex.NAVIGATOR)
    }
    
    func setsBackgroundOfColorButtonNavigationBar() {
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    }
    
    func setsStyleTitleNavigationBar(){
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
}