//
//  AccountNumberTextField.swift
//  BWBankProject
//
//  Created by Gabriel Olbrisch on 26/09/22.
//

import Foundation
import UIKit

final class AccountNumberTextField: BaseTextField {
    
    var isValidAccount: Bool {
        guard let text = textField.text else { return false }
        return FormValidator.validateAccount(text)
    }
    
    override init() {
        super.init()
        formater = "###.#####-##"
        textField.keyboardType = .numberPad
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        self.state = isValidAccount || (textField.text ?? "").isEmpty ? .normal : .withError("Conta inválida")
    }
    
}
