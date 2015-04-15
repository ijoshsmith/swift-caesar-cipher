//
//  CaesarCipher.swift
//  caesar
//
//  Created by Joshua Smith on 4/14/15.
//  Copyright (c) 2015 iJoshSmith. All rights reserved.
//

import Foundation

// Implements the encryption method used to protect Julius Caesar's private correspondence,
// as well an algorithm using the chi-squared statistic to attempt cracking enciphered text.
class CaesarCipher
{
    // MARK: - encipher
    
    class func encipher(text: String, shiftBy: UInt32) -> String
    {
        return Array(text.uppercaseString.unicodeScalars)
            .map        { self.encipherCharValue($0.value, shiftBy: shiftBy) }
            .reduce("") { $0 + letterFromValue($1) }
    }
    
    private class func encipherCharValue(charValue: UInt32, shiftBy: UInt32) -> UInt32
    {
        return Letters.isUppercaseLetterValue(charValue)
            ? encipherLetterValue(charValue, shiftBy: shiftBy)
            : charValue
    }
    
    private class func encipherLetterValue(letterValue: UInt32, shiftBy: UInt32) -> UInt32
    {
        let shiftedValue = (letterValue - Letters.A) + shiftBy
        return Letters.A + (shiftedValue % 26)
    }
    
    private class func letterFromValue(value: UInt32) -> String
    {
        return String(Character(UnicodeScalar(value)))
    }
    
    // MARK: - decipher
    
    class func decipher(text: String, letterFrequencies: [Double]) -> String?
    {
        let freqTable  = createLetterFrequencyTable(text)
        let chiSquares = freqTable.map { self.chiSquare($0, letterFrequencies) }
        let minValue   = minElement(chiSquares)
        let shiftBy    = find(chiSquares, minValue)!
        let confident  = minValue < 2.0 // Allow only a small degree of uncertainty.
        return confident ? encipher(text, shiftBy: UInt32(shiftBy)) : nil
    }
    
    private class func createLetterFrequencyTable(text: String) -> [[Double]]
    {
        return Array(0..<26).map { (shiftBy: UInt32) -> [Double] in
            let encipheredText  = self.encipher(text, shiftBy: shiftBy)
            let encipheredWords = encipheredText.componentsSeparatedByString(" ")
            return LetterFrequency.analyzeWords(encipheredWords)
        }
    }
    
    // Calculates the degree of difference between observed and expected values.
    private class func chiSquare(observed: [Double], _ expected: [Double]) -> Double
    {
        return Array(zip(observed, expected))
            .reduce(0.0) { (sum, values) in
                let delta = values.0 - values.1
                return sum + ((delta * delta) / values.1)
        }
    }
}
