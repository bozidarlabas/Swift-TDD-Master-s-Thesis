//
//  SimplExampleTests.swift
//  MastersThesis
//
//  Created by Bozidar on 01.09.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import XCTest
@testable import MastersThesis


class SimplExampleTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func testWordReverse() {
        let simpleExample = SimpleExample()
        let word = "bozidar"
        let reversedWord = simpleExample.reverseWord(word)
        let message = "word: " + word + " -> reversed word: " + reversedWord
        
        XCTAssertEqual(reversedWord, "radizob", message)
    }      


}
