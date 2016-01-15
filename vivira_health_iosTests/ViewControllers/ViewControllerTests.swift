import XCTest
@testable import vivira_health_ios

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        viewController = navigationController.topViewController as! ViewController
        let _ = viewController.view
        viewController.viewWillAppear(true)
    }
    
    func testNavigationBarShowing() {
        XCTAssertFalse(viewController.navigationController!.navigationBarHidden, "Nav bar should be showing")
    }

}
