//
//  AppDependecies.swift
//  Calculator
//
//  Created by Bozidar on 06.05.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import Foundation

class AppDependencies: NSObject {
    static let sharedInstance = AppDependencies()
    
    override init() {
        super.init()
    }
}