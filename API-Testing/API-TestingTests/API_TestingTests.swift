import XCTest
@testable import API_Testing

final class API_TestingTests: XCTestCase {
    
    var dataManager: DataManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let mockSession = MockNetworkSession()
        dataManager = DataManager(session: mockSession)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dataManager = nil
    }
    
    func testFetchUsers() throws {
        
        let expectation = XCTestExpectation(description: #function)
        dataManager.fetchData(url: URL(string: APIConstants.url)) { result in
            switch result {
            case .success(let userList):
                XCTAssert(userList.total > 0, "Users list is empty")
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation])
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
