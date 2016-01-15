
import UIKit


class UtilColors: NSObject {
    
    class func colorNavigationBar() -> UIColor{
        return UIColor.colorWithHexString("#E92B2A")
    }
    
    class func ColorWrite() -> UIColor {
        return UIColor.whiteColor()
    }
    
    class func ColorWrite(alpha: CGFloat) -> UIColor {
        return UIColor.whiteColor().colorWithAlphaComponent(alpha)
    }
    
    class func ColorDarkRed() -> UIColor {
        return UIColor.colorWithHexString("#731705")
    }
    
    class func ColorDarkRed(alpha: CGFloat) -> UIColor {
        return UIColor.colorWithHexString("#731705").colorWithAlphaComponent(alpha)
    }
    
    class func colorBlueLight () -> UIColor{
        return UIColor.colorWithHexString("#63C5F0")
    }
    
    class func colorGrey1 () -> UIColor{
        return UIColor.colorWithHexString("#8E8E93")
    }
    
    class func colorGrey2 () -> UIColor{
        return UIColor.colorWithHexString("#9f9fa4")
    }
    
    class func colorGrey3 () -> UIColor{
        return UIColor.colorWithHexString("#E6E6E6")
    }
    
    class func colorGrey4 () -> UIColor{
        return UIColor.colorWithHexString("#D8D8D8")
    }
}
