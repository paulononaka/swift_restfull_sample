import XCTest

class CreateUserUITests: XCTestCase {
    
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
    
    func testShouldBeAbleToCreateANewUser() {
        
        // When I create a new User
        
        app.navigationBars["Users"].buttons["Add"].tap()
        
        // And fill the form and save
        
        let tablesQuery = app.tables
        
        let textField = tablesQuery.cells.containingType(.StaticText, identifier:"Name").childrenMatchingType(.TextField).element
        textField.tap()
        textField.typeText("Paulo Nonaka")
        
        let textField2 = tablesQuery.cells.containingType(.StaticText, identifier:"E-mail").childrenMatchingType(.TextField).element
        textField2.tap()
        textField2.typeText("paulononaka@gmail.com")
        
        let textView = tablesQuery.cells.containingType(.StaticText, identifier:"Description").childrenMatchingType(.TextView).element
        textView.tap()
        textView.typeText("Nice guy!")
        
        app.buttons["Confirm"].tap()
        app.navigationBars["New user"].buttons["Save"].tap()
        
        // Then I should see success message
        
        XCTAssert(app.alerts["Vivira"].staticTexts["New user created with success!"].exists)
    }
    
}
