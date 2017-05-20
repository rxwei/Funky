import XCTest
@testable import Funky

class FunkyTests: XCTestCase {
    func testMap() {
        XCTAssertEqual([1,2,3,4,5].map(+1), [2,3,4,5,6])
        XCTAssertEqual(Set([1,2,3,4,5]).map(/100 • *100 • +1), Set([2,3,4,5,6]))
    }

    func testFlatMap() {
        XCTAssertEqual([1,2,3,4,5].flatMap{$0 % 2 == 0 ? .return($0) : []}, [2,4])
        XCTAssertEqual(Set([1,2,3,4,5]).flatMap{$0 % 2 == 0 ? .return($0) : []}, Set([2,4]))
    }

    func testAssociatiability() {
        XCTAssertEqual(["","hello","hola","meow","meh"].reduced(), "helloholameowmeh")
    }

    static var allTests : [(String, (FunkyTests) -> () throws -> Void)] {
        return [
            ("testMap", testMap),
            ("testFlatMap", testFlatMap),
            ("testAssociability", testAssociatiability),
        ]
    }
}
