//
//  Extension+Float.swift
//  TopMovie
//
//  Created by Dikran Teymur on 25.12.2023.
//

import Foundation

extension Float {
    
    func numberFormatterWith(fractionDigit: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = fractionDigit
        guard let formettedNumber = formatter.string(from: NSNumber(value: self)) else { return String(self) }
        return formettedNumber
    }
}
