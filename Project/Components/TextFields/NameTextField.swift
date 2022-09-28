//
//  NameTextField.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 29/05/22.
//

import Foundation
import UIKit

final class NameTextField: BaseTextField {
    
    var isValidName: Bool {
        guard let text = textField.text else { return false }
        return FormValidator.validateName(text)
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        self.state = isValidName || (textField.text ?? "").isEmpty ? .normal : .withError("Seu nome é muito curto")
    }
    
}
