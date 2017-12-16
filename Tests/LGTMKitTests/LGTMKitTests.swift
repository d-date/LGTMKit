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
    
    func testMarkdown() {
        guard let url = URL(string: "https://test.lgtmkit.com") else {
            fatalError("Should check URL format")
        }
        
        let markdown = LGTMKit.asMarkdown(imageUrl: url)
        XCTAssert(markdown.contains("img"), "Necessary img tag")
        XCTAssert(markdown.contains("align='center'"), "Changed alignment?")
    }

    static var allTests = [
        ("testFetchLGTM", testFetchLGTM),
        ("testFetchLGTMHTTPSOnly", testFetchLGTMHTTPSOnly)
    ]

}
