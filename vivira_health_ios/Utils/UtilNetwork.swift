import UIKit
import ReachabilitySwift

class UtilNetwork: NSObject {
    
    static let sharedInstance = UtilNetwork()
    
    func isNetworkAvailable() -> Bool {
        
        let reachability: Reachability
        do {
            reachability = try Reachability.reachabilityForInternetConnection()
            return reachability.isReachable()
        } catch {
        }
        
        return false
    }
}
