import UIKit
import OHHTTPStubs

class HTTPStub: NSObject {
    
    class func stubHTTPIfTesting() {
        
        let ENV = NSProcessInfo.processInfo().environment
        let CONTENT_TYPE = "Content-Type"
        let APPLICATION_JSON = "application/json"
        
        if ENV["TEST"] != nil {
            stub(isHost(Constants.WS.HOST)) { request in
                return OHHTTPStubsResponse(fileAtPath: OHPathForFile("3_users.json", self)!,
                    statusCode:200, headers:[CONTENT_TYPE: APPLICATION_JSON])
            }
        }
    }
    
}
