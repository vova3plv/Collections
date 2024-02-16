//
//  DictionaryViewControllerUITests.swift
//  CollectionsUITests
//
//  Created by Владимир Берденко on 16.02.2024.
//

import XCTest

final class DictionaryViewControllerUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        try displayDictionaryVC()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func test_FirstCellExists() throws {
        try test_CellExists(textInCell: "Find the first contact", boundBy: 0)
    }
    
    func test_SecondCellExists() throws {
        try test_CellExists(textInCell: "Find the first contact", boundBy: 1)
    }
    
    func test_ThirdCellExists() throws {
        try test_CellExists(textInCell: "Find the last contact", boundBy: 2)
    }
    
    func test_FourthCellExists() throws {
        try test_CellExists(textInCell: "Find the last contact", boundBy: 3)
    }
    
    func test_FifthCellExists() throws {
        try test_CellExists(textInCell: "Search for a non-existing element", boundBy: 4)
    }
    
    func test_SixthCellExists() throws {
        try test_CellExists(textInCell: "Search for a non-existing element", boundBy: 5)
    }
    
    func test_TapFirstCell() throws {
        try test_TapFindingFirstCell(boundBy: 0)
    }
    
    func test_TapSecondCell() throws {
        try test_TapFindingFirstCell(boundBy: 1)
    }
    
    func test_TapThirdCell() throws {
        try test_TapFindingLastCell(boundBy: 2)
    }
    
    func test_TapFourthCell() throws {
        try test_TapFindingLastCell(boundBy: 3)
    }
    
    func test_TapFifthCell() throws {
        try test_TapSearchNonExistingCell(boundBy: 4)
    }
    
    func test_TapSixthCell() throws {
        try test_TapSearchNonExistingCell(boundBy: 5)
    }
    
    func test_CellExists(textInCell: String, boundBy: Int) throws {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: boundBy).staticTexts[textInCell]
        XCTAssertTrue(cell.exists)
        
    }
    
    func test_TapFindingFirstCell(boundBy: Int) throws {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: boundBy)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        let predicate = NSPredicate { _, _ in
            !cell.activityIndicators.element.exists
        }
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 30)
        XCTAssertTrue(cell.staticTexts["CellLabelID"].label.contains("First element search time: "))
    }
    
    func test_TapFindingLastCell(boundBy: Int) throws {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: boundBy)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        let predicate = NSPredicate { _, _ in
            !cell.activityIndicators.element.exists
        }
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 30)
        XCTAssertTrue(cell.staticTexts["CellLabelID"].label.contains("Last element search time: "))
    }
    
    func test_TapSearchNonExistingCell(boundBy: Int) throws {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: boundBy)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        let predicate = NSPredicate { _, _ in
            !cell.activityIndicators.element.exists
        }
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 30)
        XCTAssertTrue(cell.staticTexts["CellLabelID"].label.contains("Non-existing element search time: "))
    }
    
    func displayDictionaryVC() throws {
        app.tables.cells.staticTexts["Dictionary"].tap()
        let predicate = NSPredicate { _, _ in
            !self.app.activityIndicators.element.exists
        }
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 30)
    }
}
