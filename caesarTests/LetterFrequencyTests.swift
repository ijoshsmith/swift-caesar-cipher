//
//  LetterFrequencyTests.swift
//  caesar
//
//  Created by Joshua Smith on 4/14/15.
//  Copyright (c) 2015 iJoshSmith. All rights reserved.
//

import XCTest

class LetterFrequencyTests: XCTestCase
{
    func test_analyzeWords_twoWords_returnsCorrectPercentages()
    {
        let actual = LetterFrequency.analyzeWords(["Area", "Banana"])
        let expected =
        [
            0.5, // A
            0.1, // B
            0.0, // C
            0.0, // D
            0.1, // E
            0.0, // F
            0.0, // G
            0.0, // H
            0.0, // I
            0.0, // J
            0.0, // K
            0.0, // L
            0.0, // M
            0.2, // N
            0.0, // O
            0.0, // P
            0.0, // Q
            0.1, // R
            0.0, // S
            0.0, // T
            0.0, // U
            0.0, // V
            0.0, // W
            0.0, // X
            0.0, // Y
            0.0  // Z
        ]
        XCTAssertEqual(actual, expected, "")
    }
}
