//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Bozidar on 06.05.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelLastSign: UILabel!
    
    var previusNumber: String!
    var currentNumber: String!
    var operation: Character!
    
    var inScreen: String!  {
        willSet {
            labelResult?.text = newValue
        }
    }
    
    var result: String! {
        willSet {
            labelLastSign?.text = String(operation)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
    }
    
    func setStyle() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        let character = [Character](sender.titleLabel!.text!.characters)[0]
        addNumber(character)
    }
    
    @IBAction func dotPressed(sender: UIButton) {
        addDot()
    }
    
    @IBAction func equalPressed(sender: UIButton) {
        performEqual()
    }
    
    @IBAction func changeSignPressed() {
        let curNum = "\(-Double(self.inScreen)!)"
        initializeValues(previusNumber, currentNumber: curNum, operation: operation, inScreen: curNum)
    }
    
    @IBAction func clearPressed(sender: UIButton) {
        clear()
    }
    
    @IBAction func addOperation(sender: UIButton) {
        let character = [Character](sender.titleLabel!.text!.characters)[0]
        performOperation(character)
    }
    
    @IBAction func percentPressed() {
        let curNum = "\(Double(self.inScreen)! / 100)"
        initializeValues(previusNumber, currentNumber: curNum, operation: operation, inScreen: curNum)
    }
    
    func addNumber(char: Character) {
        let curNum = currentNumber == nil ? String(char) : inScreen + String(char)
        initializeValues(previusNumber, currentNumber: curNum, operation: operation, inScreen: curNum)
    }
    
    func performOperation(op: Character) -> String{
        if previusNumber == nil {
            initializeValues(currentNumber, currentNumber: nil, operation: op, inScreen: currentNumber)
            result = ""
            return result
        } else {
            result = calculate()
            initializeValues(result, currentNumber: nil, operation: op, inScreen: result)
            return result
        }
    }
    
    func performEqual() -> String{
        result = calculate()
        initializeValues(nil, currentNumber: result, operation: nil, inScreen: result)
        return result
    }
    
    func calculate() -> String {
        let previous = Double(previusNumber ?? "0")
        let current = Double(inScreen)!
        var result = ""

        switch(operation) {
        case "+":
            result = "\(previous! + current)"
            break
        case "-":
            result = "\(previous! - current)"
            break
        case "x":
            result = "\(previous! * current)"
            break
        case "/":
            result = "\(previous! / current)"
            break
        default: break
        }
        return result
    }
    
    func addDot() -> String {
        let curNum = inScreen.rangeOfString(".") == nil ? currentNumber + "." : currentNumber
        initializeValues(previusNumber, currentNumber: curNum, operation: operation, inScreen: curNum)
        return currentNumber
    }
    
    func clear() {
        initializeValues(nil, currentNumber: nil, operation: nil, inScreen: "0")
        result = ""
    }
    
    func initializeValues(previusNumber: String!, currentNumber: String!, operation: Character!, inScreen: String) {
        self.previusNumber = previusNumber
        self.currentNumber = currentNumber
        self.operation = operation
        self.inScreen = inScreen
    }
}
