//
//  DocumentTextField.swift
//  BWBankProject
//
//  Created by Gabriel Olbrisch on 27/09/22.
//

import Foundation
import UIKit

enum DocumentType {
    case cpf
    case cnpj
    
    var mask: String {
        switch self {
        case .cpf:
            return  "###.###.###-##"
        case .cnpj:
            return "##.###.###/####-##"
        }
    }
}

final class DocumentTextField: BaseTextField {
    
    var documentType: DocumentType {
        didSet { formater = documentType.mask }
    }
    
    var isValidDocument: Bool {
        guard let text = textField.text else { return false }
        return FormValidator.validateDocument(text, documentType: documentType)
    }
    
    init(documentType: DocumentType) {
        self.documentType = documentType
        super.init()
        formater = documentType.mask
        textField.keyboardType = .numberPad
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        self.state = isValidDocument || (textField.text ?? "").isEmpty ? .normal : .withError(documentType == .cpf ? "CPF inválido" : "CNPJ inválido")
    }
    
}
