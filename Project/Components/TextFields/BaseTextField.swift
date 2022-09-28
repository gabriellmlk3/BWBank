//
//  BaseTextField.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import Foundation
import UIKit

enum TextFieldState {
    case withError(_ error: String)
    case disabled
    case normal
    
    var errorHintAlpha: CGFloat {
        switch self {
        case .withError:
            return 1
        default:
            return 0
        }
    }
    
    var errorText: String {
        switch self {
        case .withError(let error):
            return error
        default:
            return ""
        }
    }
    
    var borderColor: CGColor? {
        switch self {
        case .withError:
            return UIColor.systemRed.cgColor
        case .normal:
            return UIColor.white.cgColor
        default:
            return nil
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .withError:
            return 1
        default:
            return 0
        }
    }
    
    var isEnable: Bool {
        switch self {
        case .disabled:
            return false
        default:
            return true
        }
    }
}

class BaseTextField: UIView {
    
    private var titleLable: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    var textField: PaddindTextField = {
        let textField = PaddindTextField()
        textField.backgroundColor = .lightGray.withAlphaComponent(0.1)
        textField.textColor = .white
        textField.clipsToBounds = true
        textField.tintColor = .white
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private var errorHindLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .systemRed
        return label
    }()
    
    var formater: String?
    
    public var state: TextFieldState = .normal { didSet { setupTextFieldViewWith(state) } }
    public var title: String? { didSet { titleLable.text = title } }
    public var placeholder: String? {
        didSet {
            let attributedString = NSMutableAttributedString(string: placeholder ?? "")
            attributedString.addAttributes([.foregroundColor : UIColor.lightGray,
                                            .font : UIFont.VDSLightItalic(ofSize: 15)],
                                           range: NSRange(location: 0, length: attributedString.length))
            textField.attributedPlaceholder = attributedString
        }
    }
    
    init() {
        super.init(frame: .zero)
        textField.delegate = self
        buildHierarchy()
        setupConstraints()
        setupTextFieldViewWith(state)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextFieldViewWith(_ state: TextFieldState) {
        self.textField.layer.borderWidth = state.borderWidth
        self.textField.isEnabled = state.isEnable
        UIView.animate(withDuration: 0.3) {
            self.errorHindLabel.text = state.errorText
            self.errorHindLabel.alpha = state.errorHintAlpha
            self.textField.layer.borderColor = state.borderColor
        }
    }

}

//MARK: - Layout
private extension BaseTextField {
    
    func buildHierarchy() {
        addSubview(titleLable)
        addSubview(textField)
        addSubview(errorHindLabel)
    }
    
    func setupConstraints() {
        titleLable.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-24)
            make.height.equalTo(45)
        }
        
        errorHindLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}

extension BaseTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        
        if let formater = self.formater {
            textField.text = newString.format(with: formater)
        } else {
            return true
        }
        
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.textColor = .black
            textField.tintColor = .black
            textField.backgroundColor = .white
            let attributedString = NSMutableAttributedString(string: textField.placeholder ?? "")
            attributedString.addAttributes([.foregroundColor : UIColor.black,
                                            .font : UIFont.VDSLightItalic(ofSize: 15)],
                                           range: NSRange(location: 0, length: attributedString.length))
            textField.attributedPlaceholder = attributedString
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.textColor = .white
            textField.tintColor = .white
            textField.backgroundColor = .lightGray.withAlphaComponent(0.1)
            let attributedString = NSMutableAttributedString(string: textField.placeholder ?? "")
            attributedString.addAttributes([.foregroundColor : UIColor.lightGray,
                                            .font : UIFont.VDSLightItalic(ofSize: 15)],
                                           range: NSRange(location: 0, length: attributedString.length))
            textField.attributedPlaceholder = attributedString
        }
    }
    
}
