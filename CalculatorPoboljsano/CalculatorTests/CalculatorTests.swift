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
            
            var calculatorState: CalculatorState!
            var expectedResult: String!
            
            func initializeValues(previousNumber: String, currentNumber: String, operation: Action){
                calculatorState.previousNumber = previousNumber
                calculatorState.inScreen = currentNumber
                calculatorState.inScreen = currentNumber
                calculatorState.operation = operation
            }
            
            beforeEach {
                calculatorState = CalculatorState.INITIAL_STATE
            }
            
            describe("Operation") {
                describe("Adding") {
                    beforeEach {
                        initializeValues("1", currentNumber: "2", operation: .Operation(.Addition))
                        expectedResult = "3.0"
                    }
                    
                    it("Call performOperation function") {
                        let result = calculatorState.performOperation(.Addition)
                        expect(result.previousNumber).to(equal(expectedResult))
                    }
                }
                
                describe("Subtracting") {
                    beforeEach {
                        calculatorState.previousNumber = "3"
                        calculatorState.inScreen = "2"
                        calculatorState.operation = .Operation(.Subtraction)
                        
                        expectedResult = "1.0"
                    }
                    
                    it("Call performOperation function") {
                        let result = calculatorState.performOperation(.Subtraction)
                        expect(result.previousNumber).to(equal(expectedResult))
                    }
                }
                
                describe("Multiplication") {
                    beforeEach {
                        calculatorState.previousNumber = "2"
                        calculatorState.inScreen = "4"
                        calculatorState.operation = .Operation(.Multiplication)
                        expectedResult = "8.0"
                    }
                    
                    it("*") {
                        let result = calculatorState.performOperation(.Multiplication)
                        expect(result.previousNumber).to(equal(expectedResult))
                    }
                }
                
                describe("Division") {
                    beforeEach {
                        calculatorState.previousNumber = "4"
                        calculatorState.inScreen = "2"
                        calculatorState.operation = .Operation(.Division)
                        expectedResult = "2.0"
                    }
                    
                    it("/") {
                        let result = calculatorState.performOperation(.Division)
                        expect(result.previousNumber).to(equal(expectedResult))
                    }
                }
                
                describe("Equal") {
                    describe("After multiplication") {
                        it("=") {
                            calculatorState.previousNumber = "4"
                            calculatorState.inScreen = "2"
                            calculatorState.operation = .Operation(.Multiplication)
                            expectedResult = "8.0"
                            
                            let result = calculatorState.performEqual()
                            expect(result.currentNumber).to(equal(expectedResult))
                        }
                    }
                    
                    describe("After division") {
                        it("=") {
                            calculatorState.previousNumber = "4"
                            calculatorState.inScreen = "2"
                            calculatorState.operation = .Operation(.Division)
                            
                            expectedResult = "2.0"
                            let result = calculatorState.performEqual()
                            
                            expect(result.currentNumber).to(equal(expectedResult))
                        }
                    }
                }
            }
            
            describe("Add dot") {
                beforeEach {
                    calculatorState.currentNumber = "5"
                    calculatorState.inScreen = "5"
                    expectedResult = "5."
                }
                
                it(".") {
                    let result = calculatorState.addDot()
                    expect(result.currentNumber).to(equal(expectedResult))
                }
            }
            
            describe("Clear all") {
                beforeEach {
                    calculatorState.currentNumber = "5"
                    calculatorState.inScreen = "5"
                    calculatorState.previousNumber = "4"
                    calculatorState.operation = .Operation(.Division)
                }
                
                it("CLR") {
                    calculatorState = CalculatorState.INITIAL_STATE
                    
                    expect(calculatorState.previousNumber).to(beNil())
                    expect(calculatorState.currentNumber).to(equal("0"))
                    expect(calculatorState.inScreen).to(equal(""))
                }
            }
        }
    }
    
    //    func testSubtractingOperation() {
    //        calculator.previusNumber = "3"
    //        calculator.inScreen = "2"
    //        calculator.operation = "-"
    //
    //        let expectedResult = "1.0"
    //        let result = calculator.performOperation("+")
    //
    //        expect(result).to(equal(expectedResult))
    //    }
    //
    //    func testMultiplicationOperation() {
    //        calculator.previusNumber = "2"
    //        calculator.inScreen = "4"
    //        calculator.operation = "x"
    //
    //        let expectedResult = "8.0"
    //        let result = calculator.performOperation("/")
    //
    //        expect(result).to(equal(expectedResult))
    //    }
    //
    //    func testDivisionOperation() {
    //        calculator.previusNumber = "4"
    //        calculator.inScreen = "2"
    //        calculator.operation = "/"
    //
    //        let expectedResult = "2.0"
    //        let result = calculator.performOperation("x")
    //
    //        expect(result).to(equal(expectedResult))
    //    }
    //
    //    func testEqual() {
    //        calculator.previusNumber = "4"
    //        calculator.inScreen = "2"
    //        calculator.operation = "x"
    //
    //        var expectedResult = "8.0"
    //        var result = calculator.performEqual()
    //
    //        expect(result).to(equal(expectedResult))
    //
    //        calculator.previusNumber = "4"
    //        calculator.inScreen = "2"
    //        calculator.operation = "/"
    //
    //        expectedResult = "2.0"
    //        result = calculator.performEqual()
    //
    //        expect(result).to(equal(expectedResult))
    //    }
    //
    //    func testAddDot() {
    //        calculator.currentNumber = "5"
    //        calculator.inScreen = "5"
    //
    //        let expectedResult = "5."
    //        let result = calculator.addDot()
    //
    //        expect(result).to(equal(expectedResult))
    //    }
    //
    //    func testClear() {
    //        calculator.currentNumber = "5"
    //        calculator.inScreen = "5"
    //        calculator.previusNumber = "4"
    //        calculator.operation = "+"
    //
    //        calculator.clear()
    //        
    //        expect(self.calculator.previusNumber).to(beNil())
    //        expect(self.calculator.currentNumber).to(beNil())
    //        expect(self.calculator.operation).to(beNil())
    //        expect(self.calculator.inScreen).to(equal("0"))
    //        
    //    }
}
