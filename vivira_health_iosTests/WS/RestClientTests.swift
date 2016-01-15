import XCTest
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import OHHTTPStubs
@testable import vivira_health_ios

class RestClientTests: XCTestCase {
    
    let TIMEOUT: NSTimeInterval = 1000
    
    override func setUp() {
        super.setUp()
        stubHTTP()
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
    
    func testGetUsersReceiveData() {
        let responseArrived = self.expectationWithDescription("response of async request has arrived")
        var receivedData: [User] = []
        
        RestClient.getUsers() { result in
            receivedData = result.result.value!.users
            responseArrived.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(TIMEOUT) { err in
            XCTAssertNotNil(receivedData, "Received data should not be nil")
            NSLog("user count: %@", String(receivedData.count))
        }
    }
    
    func testShouldReturn3Users() {
        let responseArrived = self.expectationWithDescription("response of async request has arrived")
        var receivedData: [User] = []
        
        RestClient.getUsers() { result in
            receivedData = result.result.value!.users
            responseArrived.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(TIMEOUT) { err in
            XCTAssertTrue(receivedData.count == 3, "Should return 3 users")
        }
    }
    
    func stubHTTP() {
        let CONTENT_TYPE = "Content-Type"
        let APPLICATION_JSON = "application/json"
        
        stub(isHost(Constants.WS.HOST)) { request in
            return OHHTTPStubsResponse(fileAtPath: OHPathForFile("3_users.json", self.dynamicType)!,
                statusCode:200, headers:[CONTENT_TYPE: APPLICATION_JSON])
        }
    }
    
}
