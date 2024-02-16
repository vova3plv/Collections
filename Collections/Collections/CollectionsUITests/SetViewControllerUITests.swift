import XCTest

final class SetViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        try inputTextFields()
        
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    //3 методи знизу напевно також бізнес логіку тестують
    func test_TapMatchingLettersButton() throws {
        app.buttons.staticTexts["All matching letters"].tap()
        XCTAssertTrue(app.staticTexts["elo"].exists)
    }
    
    func test_TapNotMatchCharactersButton() throws {
        app.buttons.staticTexts["All characters that do not match"].tap()
        XCTAssertTrue(app.staticTexts["HMdt"].exists)
    }
    
    func test_TapUniqueCharactersFromFirstTFButton() throws {
        app.buttons.staticTexts["All unique characters from the first text field that do not match in text fields"].tap()
        XCTAssertTrue(app.staticTexts["Md"].exists)
    }
    
    func inputTextFields() throws {
        app.tables.cells.staticTexts["Set"].tap()
        let firstTF = app.textFields["FirstTFid"]
        firstTF.tap()
        firstTF.typeText("Model")
        
        let secondTF = app.textFields["SecondTFid"]
        secondTF.tap()
        secondTF.typeText("Hotel")
    }

    
}
