import XCTest
@testable import Collections

final class ArrayCollectionTests: XCTestCase {

    var model: ArrayModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        model = ArrayModel()
    }

    override func tearDownWithError() throws {
        model = nil
        try super.tearDownWithError()
    }

    func testGenerateArray() throws {
        model.createArrays()
        XCTAssertFalse(model.isEmpty, "Array must be generate")
    }
    
    // а как другие функции тестировать если мы массив копируем
}
