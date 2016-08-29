import XCTest
@testable import Funky

class FunkyTests: XCTestCase {
    func testMap() {
        XCTAssertEqual([1,2,3,4,5].map(+1), [2,3,4,5,6])
    }


    static var allTests : [(String, (FunkyTests) -> () throws -> Void)] {
        return [
            ("testMap", testMap),
        ]
    }
}
