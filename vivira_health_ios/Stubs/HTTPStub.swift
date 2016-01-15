import UIKit
import OHHTTPStubs

class HTTPStub: NSObject {
    
    class func stubHTTPIfTesting() {
        
        let ENV = NSProcessInfo.processInfo().environment
        let CONTENT_TYPE = "Content-Type"
        let APPLICATION_JSON = "application/json"
        let GET_METHOD = "GET"
        
        if (ENV["TEST"] != nil || NSClassFromString("XCTest") != nil) {
            stub(isHost(Constants.WS.HOST)) { request in
                switch request.URL!.path! {
                case Constants.WS.END_POINT.GET_USERS:
                    if request.HTTPMethod! == GET_METHOD {
                        return OHHTTPStubsResponse(fileAtPath: OHPathForFile("3_users.json", self)!,
                            statusCode:200, headers:[CONTENT_TYPE: APPLICATION_JSON])
                    } else {
                        return OHHTTPStubsResponse(fileAtPath: OHPathForFile("user_1.json", self)!,
                            statusCode:200, headers:[CONTENT_TYPE: APPLICATION_JSON])
                    }
                case Constants.WS.END_POINT.GET_USER+String(1):
                    return OHHTTPStubsResponse(fileAtPath: OHPathForFile("user_1.json", self)!,
                        statusCode:200, headers:[CONTENT_TYPE: APPLICATION_JSON])
                case Constants.WS.END_POINT.GET_USER+String(2):
                    return OHHTTPStubsResponse(fileAtPath: OHPathForFile("user_2.json", self)!,
                        statusCode:200, headers:[CONTENT_TYPE: APPLICATION_JSON])
                case Constants.WS.END_POINT.GET_USER+String(3):
                    return OHHTTPStubsResponse(fileAtPath: OHPathForFile("user_3.json", self)!,
                        statusCode:200, headers:[CONTENT_TYPE: APPLICATION_JSON])
                default:
                    return OHHTTPStubsResponse(fileAtPath: OHPathForFile("users.json", self)!,
                        statusCode:200, headers:[CONTENT_TYPE: APPLICATION_JSON])
                }
            }
        }
    }
    
}
