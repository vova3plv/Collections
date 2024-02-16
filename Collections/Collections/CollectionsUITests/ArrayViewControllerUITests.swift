import XCTest

final class ArrayViewControllerUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        try displayArrayVC()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    //MARK: Test Cell Exists
    func test_FirstCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Insert 1000 elements at the beginning of the array one-by-one."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_SecondCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Insert 1000 elements at the beginning of the array."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_ThirdCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Insert 1000 elements in the middle of the array one-by-one."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_FourthCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Insert 1000 elements in the middle of the array."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_FifthCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Insert 1000 elements at the end of the array one-by-one."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_SixthCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Insert 1000 elements at the end of the array all."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_SeventhCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Remove 1000 elements at the beginning of the array one-by-one."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_EighthCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Remove 1000 elements at the beginning of the array."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_NinthCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Remove 1000 elements in the middle of the array one-by-one."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_TenthCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Remove 1000 elements in the middle of the array."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_EleventhCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Remove 1000 elements at the end of the array one-by-one."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_TwelfthCellExists() throws {
        let cell = app.collectionViews.cells.staticTexts["Remove 1000 elements at the end of the array."]
        XCTAssertTrue(cell.exists)
    }
    
    func test_appearTwelveCells() throws {
        XCTAssertEqual(app.collectionViews.cells.count, 12)
    }
    
    //MARK: Test Tap On Cells
    func test_TapFirstCell() throws {
        try test_TapInsertionCells(boundBy: 0)
    }
    
    func test_TapFSecondCell() throws {
        try test_TapInsertionCells(boundBy: 1)
    }
    
    func test_TapThirdCell() throws {
        try test_TapInsertionCells(boundBy: 2)
    }
    
    func test_TapFourthCell() throws {
        try test_TapInsertionCells(boundBy: 3)
    }
    
    func test_TapFifthCell() throws {
        try test_TapInsertionCells(boundBy: 4)
    }
    
    func test_TapSixthCell() throws {
        try test_TapInsertionCells(boundBy: 5)
    }
    
    func test_TapSeventhCell() throws {
        try test_TapRemovalCells(boundBy: 6)
    }
    
    func test_TapEighthCell() throws {
        try test_TapRemovalCells(boundBy: 7)
    }
    
    func test_TapNinethCell() throws {
        try test_TapRemovalCells(boundBy: 8)
    }
    
    func test_TapTenthCell() throws {
        try test_TapRemovalCells(boundBy: 9)
    }
    
    func test_TapEleventhCell() throws {
        try test_TapRemovalCells(boundBy: 10)
    }
    
    func test_TapTwelfthCell() throws {
        try test_TapRemovalCells(boundBy: 11)
    }
    
    func test_TapInsertionCells(boundBy: Int) throws {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: boundBy)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        let predicate = NSPredicate { _, _ in
            !cell.activityIndicators.element.exists
        }
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 30)
        XCTAssertTrue(cell.staticTexts["CellLabelID"].label.contains("Insertion time:"))
    }
    
    func test_TapRemovalCells(boundBy: Int) throws {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: boundBy)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        let predicate = NSPredicate { _, _ in
            !cell.activityIndicators.element.exists
        }
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 30)
        XCTAssertTrue(cell.staticTexts["CellLabelID"].label.contains("Removal time:"))
    }
    
    func displayArrayVC() throws {
        app.tables.cells.staticTexts["Array"].tap()
        app.collectionViews.staticTexts["Greate Int array with 10_000_000 elements"].tap()
        let predicate = NSPredicate { _, _ in
            self.app.collectionViews.cells.count > 0
        }
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 5)
    }
    
}
