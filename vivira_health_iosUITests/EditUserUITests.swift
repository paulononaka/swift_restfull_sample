import XCTest

class EditUserUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchEnvironment["TEST"] = "1"
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldBeAbleToEditSomeExistingUser() {
        // Given I have a user
        let user = app.tables.staticTexts["Ronald Sanders"]
        let exists = NSPredicate(format: "exists == 1")
        expectationForPredicate(exists, evaluatedWithObject: user, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)
        
        user.tap()
        
        // When I select a user from the list
        app.navigationBars["Ronald Sanders"].buttons["Edit"].tap()
        
        // And fill the form and save
        let tablesQuery = app.tables
        
        let textField = tablesQuery.cells.containingType(.StaticText, identifier:"Name").childrenMatchingType(.TextField).element
        textField.tap()
        textField.typeText(" da Silva")
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let textField2 = tablesQuery.cells.containingType(.StaticText, identifier:"E-mail").childrenMatchingType(.TextField).element
        textField2.tap()
        textField2.typeText(".br")
        returnButton.tap()
        
        let textView = tablesQuery.cells.containingType(.StaticText, identifier:"Description").childrenMatchingType(.TextView).element
        textView.tap()
        textView.typeText("Nice guy!")
        
        app.buttons["Confirm"].tap()
        
        app.navigationBars["Edit"].buttons["Save"].tap()
        
        // Then I should see success message
        XCTAssert(app.alerts["Vivira"].staticTexts["User edited with success!"].exists)
    }
    
}
