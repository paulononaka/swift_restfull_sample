import UIKit

extension UIColor{
    
    class func colorWithHex(hexValue: UInt32, alpha: CGFloat) -> UIColor {
        
        let colores:UIColor = UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0,
            green: ((CGFloat)((hexValue & 0xFF00) >> 8))/255.0,
            blue: ((CGFloat)(hexValue & 0xFF))/255.0, alpha: alpha)
        
        return colores
    }
    
    class func colorWithHex(hexValue: UInt32) -> UIColor {
        return UIColor.colorWithHex(hexValue, alpha: 1.0)
    }
    
    class func colorWithHexString(hexValue: String, alpha: CGFloat) -> UIColor {
        var hex:UInt32 = 0
        let scanner: NSScanner = NSScanner(string: hexValue)
        scanner.scanLocation = 1
        scanner.scanHexInt(&hex)
        return UIColor.colorWithHex(hex, alpha: alpha)
    }
    
    class func colorWithHexString(hexValue: String) -> UIColor {
        return UIColor.colorWithHexString(hexValue, alpha: 1.0)
    }
}
