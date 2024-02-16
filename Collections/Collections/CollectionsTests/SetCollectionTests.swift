import XCTest
@testable import Collections

final class SetCollectionTests: XCTestCase {
    
    var model: SetModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        model = SetModel()
    }

    override func tearDownWithError() throws {
        model = nil
        try super.tearDownWithError()
    }

    func testIsLetters() throws {
        XCTAssertTrue(model.isLetters(text: "Letter"))
    }
    
    func testMatchingLetters() throws {
        XCTAssertEqual(model.matchingLetters("Model", "Hotel"), "elo")
    }
    
    func testNotMatchCharacter() throws {
        XCTAssertEqual(model.notMatchCharacter("Model", "Hotel"), "HMdt")
    }
    
    func testUniqueCharactersFromFirstTF() throws {
        XCTAssertEqual(model.uniqueCharactersFromFirstTF("Model", "Hotel"), "Md")
    }
}
