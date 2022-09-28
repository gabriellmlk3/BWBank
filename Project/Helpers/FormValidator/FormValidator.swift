//
//  FormValidator.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import Foundation

final class FormValidator {
    
    public class func validateDocument(_ document: String, documentType: DocumentType) -> Bool {
        switch documentType {
        case .cpf:
            let numbers = document.compactMap(\.wholeNumberValue)
            guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
            return numbers.prefix(9).cpfDigit == numbers[9] && numbers.prefix(10).cpfDigit == numbers[10]
        case .cnpj:
            let numbers = document.compactMap(\.wholeNumberValue)
            guard numbers.count == 14 && Set(numbers).count != 1 else { return false }
            return numbers.prefix(12).cnpjDigit == numbers[12] && numbers.prefix(13).cnpjDigit == numbers[13]
        }
    }
    
    public class func validateAccount(_ account: String) -> Bool {
        return account.onlyNumbers().count == 10
    }
    
    public class func validateName(_ name: String) -> Bool {
        return name.count > 1
    }
    
    public class func validatePassword(_ password: String) -> Bool {
        return password.count >= 8
    }
    
    public class func passwordsMatch(password: String, repeatedPasswords: String) -> Bool {
        return password == repeatedPasswords
    }
    
    public class func validateEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
