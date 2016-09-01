//
//  CalculatorNavigationBar.swift
//  Calculator
//
//  Created by Bozidar on 06.05.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import UIKit

class CalculatorNavigationBar: UINavigationBar {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        barTintColor = UIColor.elementPrimaryBackgroundColor()
        tintColor = UIColor.tertiaryColor()
        //titleTextAttributes = [ NSFontAttributeName : UIFont.h2() ]
        setBackgroundImage(UIImage(), forBarMetrics: .Default)
        shadowImage = UIColor.primaryBackgroundColor().toImage(CGSize(width: 1.0, height: 1.0))
        translucent = false
    }

}