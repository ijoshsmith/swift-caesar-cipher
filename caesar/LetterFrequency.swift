//
//  LetterFrequency.swift
//  caesar
//
//  Created by Joshua Smith on 4/14/15.
//  Copyright (c) 2015 iJoshSmith. All rights reserved.
//

import Foundation

class LetterFrequency
{
    class func analyzeWords(words: [String]) -> [Double]
    {
        let letters = words
            .reduce("") { $0 + $1.uppercaseString }
            .toLetters()

        let letterCount = max(letters.count, 1)
        
        let occurrences = NSCountedSet()
        occurrences.addObjectsFromArray(letters)

        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toLetters()
        return alphabet.map {
            Double(occurrences.countForObject($0)) / Double(letterCount)
        }
    }
}
