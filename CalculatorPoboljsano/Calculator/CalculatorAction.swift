//
//  CalculatorAction.swift
//  Calculator
//
//  Created by Bozidar on 11.05.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import Foundation

enum Action {
    case Clear
    case ChangeSign
    case Percent
    case Operation(Operator)
    case Equal
    case AddNumber(Character)
    case AddDot
}