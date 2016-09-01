//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Bozidar on 06.05.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelLastSign: UILabel!
    var disposeBag = DisposeBag()
    
    //Numbers
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var changeSignButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setup()
    }
    
    func setStyle() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setup() {
        let commands: [Observable<Action>] = [
            zeroButton.rx_tap.map { _ in .AddNumber("0") },
            oneButton.rx_tap.map { _ in .AddNumber("1") },
            twoButton.rx_tap.map { _ in .AddNumber("2") },
            threeButton.rx_tap.map { _ in .AddNumber("3") },
            fourButton.rx_tap.map { _ in .AddNumber("4") },
            fiveButton.rx_tap.map { _ in .AddNumber("5") },
            sixButton.rx_tap.map { _ in .AddNumber("6") },
            sevenButton.rx_tap.map { _ in .AddNumber("7") },
            eightButton.rx_tap.map { _ in .AddNumber("8") },
            nineButton.rx_tap.map { _ in .AddNumber("9") },
            
            clearButton.rx_tap.map { _ in .Clear },
            changeSignButton.rx_tap.map { _ in .ChangeSign },
            percentButton.rx_tap.map { _ in .Percent },
            divideButton.rx_tap.map { _ in .Operation(.Division) },
            multiplyButton.rx_tap.map { _ in .Operation(.Multiplication) },
            minusButton.rx_tap.map { _ in .Operation(.Subtraction) },
            plusButton.rx_tap.map { _ in .Operation(.Addition) },
            equalButton.rx_tap.map { _ in .Equal },
            dotButton.rx_tap.map { _ in .AddDot }
        ]
        
        commands
            .toObservable()
            .merge()
            .scan(CalculatorState.INITIAL_STATE) { calculatorState, lastState in
                return calculatorState.getNewState(lastState)
            }
            .debug("debugging")
            .subscribeNext { [weak self] newState in
                self?.labelResult.text = newState.inScreen
                switch newState.operation {
                case .Operation(let operation):
                    switch operation{
                    case .Addition:
                        self?.labelLastSign.text = "+"
                    case .Subtraction:
                        self?.labelLastSign.text = "-"
                    case .Multiplication:
                        self?.labelLastSign.text = "x"
                    case .Division:
                        self?.labelLastSign.text = "/"
                    }
                default:
                    self?.labelLastSign.text = ""
                }
        }.addDisposableTo(disposeBag)
    }
}
