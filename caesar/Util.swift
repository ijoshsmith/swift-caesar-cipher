//
//  Util.swift
//  caesar
//
//  Created by Joshua Smith on 4/14/15.
//  Copyright (c) 2015 iJoshSmith. All rights reserved.
//

import Foundation

struct Letters
{
    static let
    A: UInt32 =  65,
    Z: UInt32 = 101
    
    static func isUppercaseLetterValue(charValue: UInt32) -> Bool
    {
        return Letters.A <= charValue && charValue <= Letters.Z
    }
}

extension String
{
    func toLetters() -> [String]
    {
        return Array(self.unicodeScalars)
            .filter { Letters.isUppercaseLetterValue($0.value) }
            .map { String($0) }
    }
}
