//
//  CalculatorState.swift
//  Calculator
//
//  Created by Bozidar on 11.05.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import Foundation

struct CalculatorState {
    static let INITIAL_STATE = CalculatorState(previousNumber: nil, operation: .Clear, currentNumber: "0", inScreen: "")
    
    var previousNumber: String!
    var operation: Action
    var currentNumber: String!
    var inScreen: String
}

extension CalculatorState {
    
    func getNewState(action: Action) -> CalculatorState {
        switch action {
        case .Clear:
            return CalculatorState.INITIAL_STATE
        case .AddNumber(let c):
            return addNumber(c)
        case .AddDot:
            return addDot()
        case .ChangeSign:
            return changeSign()
        case .Percent:
            return percent()
        case .Operation(let op):
            return performOperation(op)
        case .Equal:
            return performEqual()
        }
    }
    
    func addNumber(char: Character) -> CalculatorState {
        let curNum = currentNumber == nil ? String(char) : inScreen + String(char)
        return CalculatorState(previousNumber: previousNumber, operation: operation, currentNumber: curNum, inScreen: curNum)
    }
    
    func addDot() -> CalculatorState {
        let curNum = inScreen.rangeOfString(".") == nil ? currentNumber + "." : currentNumber
        return CalculatorState(previousNumber: previousNumber, operation: operation, currentNumber: curNum, inScreen: curNum)
    }
    
    func changeSign() -> CalculatorState {
        let curNum = "\(-Double(self.inScreen)!)"
        return CalculatorState(previousNumber: previousNumber, operation: operation, currentNumber: curNum, inScreen: curNum)
    }
    
    func percent() -> CalculatorState{
        let curNum = "\(Double(self.inScreen)! / 100)"
        return CalculatorState(previousNumber: previousNumber, operation: operation, currentNumber: curNum, inScreen: curNum)
    }
    
    func performOperation(op: Operator) -> CalculatorState {
        if previousNumber == nil {
            return CalculatorState(previousNumber: currentNumber, operation: .Operation(op), currentNumber: nil, inScreen: currentNumber)
        } else {
            let previous = Double(previousNumber)!
            let current = Double(inScreen)!
            
            switch operation {
            case .Operation(let op):
                switch op {
                case .Addition:
                    let result = "\(previous + current)"
                    return CalculatorState(previousNumber: result, operation: .Operation(op), currentNumber: nil, inScreen: result)
                case .Subtraction:
                    let result = "\(previous - current)"
                    return CalculatorState(previousNumber: result, operation: .Operation(op), currentNumber: nil, inScreen: result)
                case .Multiplication:
                    let result = "\(previous * current)"
                    return CalculatorState(previousNumber: result, operation: .Operation(op), currentNumber: nil, inScreen: result)
                case .Division:
                    let result = "\(previous / current)"
                    return CalculatorState(previousNumber: result, operation: .Operation(op), currentNumber: nil, inScreen: result)
                }
            default:
                return CalculatorState(previousNumber: nil, operation: .Operation(op), currentNumber: currentNumber, inScreen: inScreen)
            }
        }
    }
    
    func performEqual() -> CalculatorState {
        let previous = Double(previousNumber ?? "0")
        let current = Double(inScreen)!
        
        switch operation {
        case .Operation(let op):
            switch op {
            case .Addition:
                let result = "\(previous! + current)"
                return CalculatorState(previousNumber: nil, operation: .Clear, currentNumber: result, inScreen: result)
            case .Subtraction:
                let result = "\(previous! - current)"
                return CalculatorState(previousNumber: nil, operation: .Clear, currentNumber: result, inScreen: result)
            case .Multiplication:
                let result = "\(previous! * current)"
                return CalculatorState(previousNumber: nil, operation: .Clear, currentNumber: result, inScreen: result)
            case .Division:
                let result = previous! / current
                let resultText = result == Double.infinity ? "0" : "\(result)"
                return CalculatorState(previousNumber: nil, operation: .Clear, currentNumber: resultText, inScreen: resultText)
            }
        default:
            return CalculatorState(previousNumber: nil, operation: .Clear, currentNumber: currentNumber, inScreen: inScreen)
        }
    }
}
