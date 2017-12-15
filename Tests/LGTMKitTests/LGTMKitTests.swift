import XCTest
@testable import LGTMKit

class LGTMKitTests: XCTestCase {
    func testFetchLGTM() {
        let expectation = self.expectation(description: "\(#function)")
        LGTMKit.fetchImage() { (url) in
            print(url)
            XCTAssert(url.absoluteString != "")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0)
    }

    func testFetchLGTMHTTPSOnly() {
        let expectation = self.expectation(description: "\(#function)")
        LGTMKit.fetchImage(httpsImageOnly: true) { (url) in
            print(url)
            XCTAssert(url.absoluteString != "")
            XCTAssert(url.scheme! == "https")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10.0)
    }

    static var allTests = [
        ("testFetchLGTM", testFetchLGTM),
        ("testFetchLGTMHTTPSOnly", testFetchLGTMHTTPSOnly)
    ]

}
