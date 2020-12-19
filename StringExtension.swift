//
//  StringExtension.swift
//  HandyExtensions
//
//  Created by Alina Alinovna on 19.12.2020.
//

import Foundation

extension String: LocalizedError {
    static let numbers: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    static let hexSymbols: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "A", "B", "C", "D", "E", "F" ]
    
    public var errorDescription: String? { return self }
    
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        return Set(self).isSubset(of: String.numbers)
    }
    
    var isHex: Bool {
        guard self.count > 0 && self.count % 2 == 0 else { return false }
        return Set(self).isSubset(of: String.hexSymbols)
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }
    
    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        return String(self[start...])
    }

}
