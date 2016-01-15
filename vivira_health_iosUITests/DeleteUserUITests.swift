import XCTest

class DeleteUserUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchEnvironment["TEST"] = "1"
        app.launch()
        
        let navigation = app.navigationBars["Users"].staticTexts["Users"]
        let exists = NSPredicate(format: "exists == 1")
        expectationForPredicate(exists, evaluatedWithObject: navigation, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldBeAbleToDeleteSomeExistingUser() {
        
        // Given I have a user
        
        let user = app.tables.staticTexts["Ronald Sanders"]
        let exists = NSPredicate(format: "exists == 1")
        expectationForPredicate(exists, evaluatedWithObject: user, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)
                
        // When I select a user from the list
        
        user.tap()
        
        // And edit and click on delete button

        app.navigationBars["Ronald Sanders"].buttons["Edit"].tap()
        app.buttons["Delete user"].tap()
        
        // Then I should see success message
        
        XCTAssert(app.alerts["Vivira"].staticTexts["User deleted with success!"].exists)
    }
    
}
