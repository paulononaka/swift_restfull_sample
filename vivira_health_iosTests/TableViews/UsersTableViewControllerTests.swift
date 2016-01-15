import XCTest
@testable import vivira_health_ios

class UsersTableViewControllerTests: XCTestCase {
    
    class UtilNetworkMock: UtilNetwork {
        override func isNetworkAvailable() -> Bool {
            return false
        }
    }

    class UtilViewControllerMock: UtilViewController {
        var message: String = ""
        
        override func showMessage(viewController: UIViewController, message: String) {
            self.message = message
        }
    }
    
    override func setUp() {
        super.setUp()
    }
    
    func testNetwork() {
        let tableViewUsers = UsersTableViewController()
        tableViewUsers.utilNetwork = UtilNetworkMock()
        let utilViewControllerMock = UtilViewControllerMock()
        tableViewUsers.utilViewController = utilViewControllerMock
        tableViewUsers.getUsers()
        XCTAssertTrue(utilViewControllerMock.message == "Network not available :(", "Should show appropriated message")
    }

}
