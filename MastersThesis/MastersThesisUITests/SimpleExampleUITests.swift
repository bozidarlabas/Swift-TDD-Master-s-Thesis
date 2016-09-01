//
//  SimpleExampleUITests.swift
//  MastersThesis
//
//  Created by Bozidar on 01.09.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import XCTest

class SimpleExampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testReverseWord() {
        let app = XCUIApplication()
        app.textFields["Enter word"].tap()
        app.textFields["Enter word"].typeText("bozidar")
        app.buttons["Reverse word"].tap()
        
        let textView = app.otherElements.containingType(.TextField, identifier:"Enter word").childrenMatchingType(.TextView).element
        
        XCTAssertEqual("radizob", textView.value as? String)
    }
    
}
