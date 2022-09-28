//
//  PasswordTextField.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import Foundation
import UIKit

final class PasswordTextField: BaseTextField {
    
    let eyeButton: UIButton = {
        let button = UIButton()
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        return button
    }()
    
    var isValidPassword: Bool {
        guard let text = textField.text else { return false }
        return FormValidator.validatePassword(text)
    }
    
    override init() {
        super.init()
        eyeButton.addTarget(self, action: #selector(toggleSecureTextEntry), for: .touchUpInside)
        textField.rightViewMode = .always
        textField.keyboardType = .numberPad
        setupTextFieldVisibility(hide: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextFieldVisibility(hide: Bool) {
        let image = hide ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash")
        eyeButton.setImage(image, for: .normal)
        self.textField.rightView = eyeButton
        self.textField.isSecureTextEntry = hide
    }
    
    @objc
    private func toggleSecureTextEntry() {
        self.setupTextFieldVisibility(hide: !textField.isSecureTextEntry)
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        self.state = isValidPassword || (textField.text ?? "").isEmpty ? .normal : .withError("Senha inválida")
    }
    
}
