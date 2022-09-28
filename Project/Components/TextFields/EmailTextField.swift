//
//  EmailTextField.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import Foundation
import UIKit

final class EmailTextField: BaseTextField {
    
    var isValidEmail: Bool {
        guard let text = textField.text else { return false }
        return FormValidator.validateEmail(text)
    }
    
    override init() {
        super.init()
        textField.keyboardType = .emailAddress
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        self.state = isValidEmail || (textField.text ?? "").isEmpty ? .normal : .withError("Email inválido")
    }
    
}
