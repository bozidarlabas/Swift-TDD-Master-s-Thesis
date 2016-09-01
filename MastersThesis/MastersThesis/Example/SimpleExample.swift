//
//  SimpleExample.swift
//  MastersThesis
//
//  Created by Bozidar on 01.09.2016..
//  Copyright © 2016. Bozidar. All rights reserved.
//

import Foundation

class SimpleExample {
    
    func reverseWord(word: String) -> String {
        var buffer = ""
        
        for character in word.characters {
            buffer.insert(character, atIndex: buffer.startIndex)
        }
        
        return buffer
    }

}