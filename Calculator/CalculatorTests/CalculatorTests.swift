//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Bozidar on 06.05.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import Nimble
import Quick
@testable import Calculator

class CalculatorTests: QuickSpec {

    override func spec() {
        
        describe("Calculator") {
            
            var calculator: CalculatorViewController!
            var expectedResult: String!
            
            beforeEach {
                calculator = CalculatorViewController()
            }
            
            describe("Operation") {
                describe("Adding") {
                    beforeEach {
                        calculator.previusNumber = "1"
                        calculator.inScreen = "2"
                        calculator.operation = "+"
                        expectedResult = "3.0"
                    }
                    
                    it("+") {
                        let result = calculator.performOperation("+")
                        expect(result).to(equal(expectedResult))
                    }
                }
                
                describe("Subtracting") {
                    beforeEach {
                        calculator.previusNumber = "3"
                        calculator.inScreen = "2"
                        calculator.operation = "-"
                        
                        expectedResult = "1.0"
                    }
                    
                    it("-") {
                        let result = calculator.performOperation("+")
                        expect(result).to(equal(expectedResult))
                    }
                }
                
                describe("Multiplication") {
                    beforeEach {
                        calculator.previusNumber = "2"
                        calculator.inScreen = "4"
                        calculator.operation = "x"
                        expectedResult = "8.0"
                    }
                    
                    it("*") {
                        let result = calculator.performOperation("+")
                        expect(result).to(equal(expectedResult))
                    }
                }
                
                describe("Division") {
                    beforeEach {
                        calculator.previusNumber = "4"
                        calculator.inScreen = "2"
                        calculator.operation = "/"
                        expectedResult = "2.0"
                    }
                    
                    it("/") {
                        let result = calculator.performOperation("+")
                        expect(result).to(equal(expectedResult))
                    }
                }
                
                describe("Equal") {
                    describe("After multiplication") {
                        it("=") {
                            calculator.previusNumber = "4"
                            calculator.inScreen = "2"
                            calculator.operation = "x"
                            expectedResult = "8.0"
                            
                            let result = calculator.performEqual()
                            expect(result).to(equal(expectedResult))
                        }
                    }
                    
                    describe("After division") {
                        it("=") {
                            calculator.previusNumber = "4"
                            calculator.inScreen = "2"
                            calculator.operation = "/"
                            
                            expectedResult = "2.0"
                            let result = calculator.performEqual()
                            
                            expect(result).to(equal(expectedResult))
                        }
                    }
                }
                
            }
            
            describe("Add dot") {
                beforeEach {
                    calculator.currentNumber = "5"
                    calculator.inScreen = "5"
                    expectedResult = "5."
                }
                
                it(".") {
                    let result = calculator.addDot()
                    expect(result).to(equal(expectedResult))
                }
            }
            
            describe("Clear all") {
                beforeEach {
                    calculator.currentNumber = "5"
                    calculator.inScreen = "5"
                    calculator.previusNumber = "4"
                    calculator.operation = "+"
                }
                
                it("CLR") {
                    calculator.clear()
                    
                    expect(calculator.previusNumber).to(beNil())
                    expect(calculator.currentNumber).to(beNil())
                    expect(calculator.operation).to(beNil())
                    expect(calculator.inScreen).to(equal("0"))
                }
            }
        }
    }
}
