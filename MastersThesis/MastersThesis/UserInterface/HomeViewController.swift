//
//  HomeViewController.swift
//  MastersThesis
//
//  Created by Bozidar on 01.09.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var reverseWordTextField: UITextField!
    @IBOutlet private weak var reversedWordTextView: UITextView!
    
    private var simpleExample = SimpleExample()

    @IBAction func onReverseWordClick() {
        if let input = reverseWordTextField.text {
            reversedWordTextView.text = simpleExample.reverseWord(input)
        }
    }
}
