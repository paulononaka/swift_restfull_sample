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
        }
    }
    
    func testGetUsersShouldReturn3Users() {
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
    
    func testGetUserDetailShouldReturnTheUserPassedAsParameter() {
        let responseArrived = self.expectationWithDescription("response of async request has arrived")
        var receivedData: User = User()
        
        let userIdParam = 1
        
        RestClient.getUserDetail(userIdParam) { result in
            receivedData = result.result.value!.user!
            responseArrived.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(TIMEOUT) { err in
            XCTAssertTrue(receivedData.id == userIdParam, "Should return data from the passed user")
        }
    }
    
    func testEditUserShouldReturnTheUserPassedAsParameter() {
        let responseArrived = self.expectationWithDescription("response of async request has arrived")
        var receivedData: User = User()
        
        let userParam = User(id: 1, name: "Paulo", photo_url: "http://goo.gl/GoUUrD", email: "paulononaka@gmail.com", description: "some nice guy")
        
        RestClient.putEditUser(userParam) { result in
            receivedData = result.result.value!.user!
            responseArrived.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(TIMEOUT) { err in
            XCTAssertTrue(receivedData.id == userParam.id, "Should return data from the passed user")
        }
    }
    
    func testDeleteUserShouldReturnTheUserPassedAsParameter() {
        let responseArrived = self.expectationWithDescription("response of async request has arrived")
        var succeed: Bool = false
        
        let userIdParam = 1
        
        RestClient.deleteUser(userIdParam) { result in
            succeed = result.result.isSuccess
            responseArrived.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(TIMEOUT) { err in
            XCTAssertTrue(succeed, "Should delete with success")
        }
    }
    
    func testCreateUserShouldReturnTheUserPassedAsParameter() {
        let responseArrived = self.expectationWithDescription("response of async request has arrived")
        var receivedData: User = User()
        
        let userParam = User(id: 1, name: "Paulo", photo_url: "http://goo.gl/GoUUrD", email: "paulononaka@gmail.com", description: "some nice guy")
        
        RestClient.postCreateUser(userParam) { result in
            receivedData = result.result.value!.user!
            responseArrived.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(TIMEOUT) { err in
            XCTAssertTrue(receivedData.id == userParam.id, "Should return data from the passed user")
        }
    }
    
}
