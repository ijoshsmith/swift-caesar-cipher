//
//  CaesarCipherTests.swift
//  caesar
//
//  Created by Joshua Smith on 4/14/15.
//  Copyright (c) 2015 iJoshSmith. All rights reserved.
//

import XCTest

class CaesarCipherTests: XCTestCase
{
    // MARK: - encipher tests
    
    func test_encipher_abcShiftBy1_returnsUppercaseBCD()
    {
        XCTAssertEqual(CaesarCipher.encipher("abc", shiftBy:1), "BCD", "")
    }
    
    func test_encipher_XYZShiftBy1_returnsYZA()
    {
        XCTAssertEqual(CaesarCipher.encipher("XYZ", shiftBy:1), "YZA", "")
    }
    
    func test_encipher_theDingoAteYourBaby_returnsCorrectCiphertext()
    {
        XCTAssertEqual(
            CaesarCipher.encipher("The dingo ate your baby", shiftBy:13),
            "GUR QVATB NGR LBHE ONOL",
            "")
    }
    
    func test_encipher_iCameISawIConquered_returnsCorrectCiphertext()
    {
        XCTAssertEqual(
            CaesarCipher.encipher("I came, I saw, I conquered.", shiftBy:25),
            "H BZLD, H RZV, H BNMPTDQDC.",
            "")
    }
    
    // MARK: - decipher tests
    
    func test_decipher_encipheredTheDingoAteYourBaby_returnsOriginalPlaintext()
    {
        XCTAssertEqual(
            CaesarCipher.decipher("GUR QVATB NGR LBHE ONOL", letterFrequencies: frequencies)!,
            "THE DINGO ATE YOUR BABY",
            "")
    }
    
    func test_decipher_encipheredQuote_returnsOriginalQuote()
    {
        XCTAssertEqual(
            CaesarCipher.decipher("HS HR MNS SGDRD VDKK-EDC KNMF-GZHQDC LDM SGZS H EDZQ, ATS SGD OZKD ZMC SGD GTMFQX-KNNJHMF.", letterFrequencies: frequencies)!,
            "IT IS NOT THESE WELL-FED LONG-HAIRED MEN THAT I FEAR, BUT THE PALE AND THE HUNGRY-LOOKING.",
            "")
    }
    
    func test_decipher_sentenceShiftedByAllOffsets_alwaysReturnsCorrectPlaintext()
    {
        let plaintext = "The quick brown fox jumps over the lazy dog"
        for offset in 0..<26
        {
            let ciphertext = CaesarCipher.encipher(plaintext, shiftBy: UInt32(offset))
            XCTAssertEqual(
                CaesarCipher.decipher(ciphertext, letterFrequencies: frequencies)!,
                "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG",
                "Unable to decipher when shifted by \(offset)")
        }
    }
    
    func test_decipher_theLetterH_failsBecauseTheTextIsTooShortToMeaningfullyAnalyze()
    {
        XCTAssertNil(CaesarCipher.decipher("H", letterFrequencies: frequencies), "")
    }
    
    // MARK: - Letter frequencies
    
    lazy var frequencies = LetterFrequencies.values
    
    struct LetterFrequencies
    {
        static var values: [Double] = {
            // This assumes that the words file in OS X is always in English, which might be wrong.
            let words = LetterFrequencies.loadWordsFromFile("/usr/share/dict/words")
            return LetterFrequency.analyzeWords(words)
        }()
        
        private static func loadWordsFromFile(filePath: String) -> [String]
        {
            if let words = String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding, error: nil)
            {
                return words.componentsSeparatedByString("\n")
            }
            else
            {
                return []
            }
        }
    }
}
