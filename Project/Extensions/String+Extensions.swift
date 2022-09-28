//
//  String+Extensions.swift
//  BWBankProject
//
//  Created by Gabriel Olbrisch on 26/09/22.
//

import Foundation

extension String {
    
    func onlyNumbers() -> String {
        let characterSet = CharacterSet(charactersIn: "0123456789").inverted
        return components(separatedBy: characterSet).joined()
    }
    
    func format(with mask: String) -> String {
        let string = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = string.startIndex
        
        for character in mask where index < string.endIndex {
            if character == "#" {
                result.append(string[index])
                index = string.index(after: index)
            } else {
                result.append(character)
            }
        }
        
        return result
    }
    
}
