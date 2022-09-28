//
//  Double+Extensions.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 12/09/22.
//

import Foundation

extension Double {
    
    func inCurrency() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = "."
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return "R$ \(numberFormatter.string(from: self as NSNumber) ?? "")"
    }
    
}
