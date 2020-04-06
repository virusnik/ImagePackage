import XCTest
@testable import ImagePackage

final class ImagePackageTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ImagePackage().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
