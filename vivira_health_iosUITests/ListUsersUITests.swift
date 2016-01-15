import XCTest

class ListUsersUITests: XCTestCase {
    
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
    
    func testShouldList3UsersInTableView() {
        
        // Then I should have
        
        let cells = app.tables.cells
        XCTAssertEqual(cells.count, 3, "found instead: \(cells.count)")
    }
    
    func testShouldShowUserName() {
        
        // Then I should see
        
        let cells = app.tables.cells
        
        let staticTextOfFirstCell = cells.elementBoundByIndex(0)
            .staticTexts.elementBoundByIndex(0)
        let firstLabel: String = staticTextOfFirstCell.label
        XCTAssertEqual(firstLabel, "Ronald Sanders", "found instead: \(firstLabel)")
        
        let staticTextOfSecondCell = cells.elementBoundByIndex(1)
            .staticTexts.elementBoundByIndex(0)
        let secondLabel: String = staticTextOfSecondCell.label
        XCTAssertEqual(secondLabel, "Michael Tieló", "found instead: \(secondLabel)")

        let staticTextOfThirdCell = cells.elementBoundByIndex(2)
            .staticTexts.elementBoundByIndex(0)
        let thirdLabel: String = staticTextOfThirdCell.label
        XCTAssertEqual(thirdLabel, "David", "found instead: \(thirdLabel)")

    }
    
}
