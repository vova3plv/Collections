import XCTest
@testable import Collections

final class DictionaryCollectionTests: XCTestCase {

    var model: DictionaryModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        model = DictionaryModel()
    }

    override func tearDownWithError() throws {
        model = nil
        try super.tearDownWithError()
    }

    func testGenerateCollections() throws {
        model.createCollections()
        XCTAssertEqual(model.arrayOfNames.count, 10_000_000)
        XCTAssertEqual(model.arrayOfPhones.count, 10_000_000)
        XCTAssertEqual(model.dictionaryOfContacts.count, 10_000_000)
    }
    
    func testFindFirstElementOfArray() throws {
        model.createCollections()
        let actualPhoneNumber = model.startOperation(for: .findFirstElement, ofArray: true)
        XCTAssertEqual(actualPhoneNumber, "0990")
    }
    
    func testFindFirstElementOfDictionary() throws {
        model.createCollections()
        let actualPhoneNumber = model.startOperation(for: .findFirstElement, ofArray: false)
        XCTAssertEqual(actualPhoneNumber, "0500")
    }
    
    func testFindLastElementOfArray() throws {
        model.createCollections()
        let actualPhoneNumber = model.startOperation(for: .findLastElement, ofArray: true)
        XCTAssertEqual(actualPhoneNumber, "099999999")
    }
    
    func testFindLastElementOfDictionary() throws {
        model.createCollections()
        let actualPhoneNumber = model.startOperation(for: .findLastElement, ofArray: false)
        XCTAssertEqual(actualPhoneNumber, "050999999")
    }
    
    func testSearchForNonExistingElementOfArray() throws {
        model.createCollections()
        let actualPhoneNumber = model.startOperation(for: .searchForNonExistingElement, ofArray: true)
        XCTAssertEqual(actualPhoneNumber, "does not exist")
    }
    
    func testSearchForNonExistingElementOfDictionary() throws {
        model.createCollections()
        let actualPhoneNumber = model.startOperation(for: .searchForNonExistingElement, ofArray: false)
        XCTAssertEqual(actualPhoneNumber, "does not exist")
    }
}
