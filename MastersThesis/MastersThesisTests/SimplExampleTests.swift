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

    var simpleExample: SimpleExample!
    
    override func setUp() {
        super.setUp()
        simpleExample = SimpleExample()
    }

    
    func testWordReverse() {
        let word = "bozidar"
        let reversedWord = simpleExample.reverseWord(word)
        let message = "word: " + word + " -> reversed word: " + reversedWord
        
        XCTAssertEqual(reversedWord, "radizob", message)
    }
    
    func testCountWords() {
        let inputString = "Hello world"
        let expectedWordCount = 2
        let result = simpleExample.countWords(inputString)
        
        XCTAssertEqual(expectedWordCount, result)
    }
    
    func testCountWords2() {
        let string = "Hello world again"
        let result = simpleExample.countWords(string)
        
        XCTAssertEqual(3, result)
    }



}
