//
//  NavigationService.swift
//  Calculator
//
//  Created by Bozidar on 06.05.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import UIKit

class NavigationService: NSObject {
    
    let rootNavigationController = UINavigationController(navigationBarClass: CalculatorNavigationBar.self, toolbarClass: nil)
    
    func pushCalculatorViewController(window: UIWindow) {
        
        let calculatorViewController = CalculatorViewController()
        rootNavigationController.pushViewController(calculatorViewController, animated: false)
        
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()

    }
}
