import XCTest
@testable import SwiftYAML

class SwiftYAMLTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SwiftYAML().text, "Hello, World!")
    }


    static var allTests : [(String, (SwiftYAMLTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
