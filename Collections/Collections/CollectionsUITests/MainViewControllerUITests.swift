import XCTest

final class MainViewControllerUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {}

    func testOpenArrayViewController() throws {
        app.tables.cells.staticTexts["Array"].tap()
        XCTAssert(app.navigationBars["Arrays"].exists)
    }
    
    func testOpenSetViewController() throws {
        app.tables.cells.staticTexts["Set"].tap()
        XCTAssert(app.navigationBars["Set"].exists)
    }
        
    func testOpenDictionaryViewController() throws {
        app.tables.cells.staticTexts["Dictionary"].tap()
        XCTAssert(app.navigationBars["Dictionary"].exists)
    }

}
