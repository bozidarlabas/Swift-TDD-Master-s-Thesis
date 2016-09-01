//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Bozidar on 16.07.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        
        let button = app.buttons["="]
        button.tap()
        app.buttons["x"].tap()
        app.buttons["8"].tap()
        button.tap()
        app.buttons["/"].tap()
        app.buttons["7"].tap()
        button.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
