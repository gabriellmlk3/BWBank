//
//  SignupViewController.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 29/05/22.
//

import Foundation
import UIKit

protocol SignupSceneViewControllerInput: AnyObject {
    func showSignupSuccess(accountNumber: String)
    func showSignupFailure(message: String)
}

protocol SignupSceneViewControllerOutput: AnyObject {
    func tryToSignup(form: SignupFormModel)
}

final class SignupSceneViewController: BaseViewController {
    var interactor: SignupSceneInteractorInput?
    var router: SignupSceneRoutingLogic?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Cadastre-se"
        label.font = UIFont.railroadGothicCC(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    let nameTextField: NameTextField = {
        let textField = NameTextField()
        textField.title = "Nome"
        textField.placeholder = "Seu nome"
        return textField
    }()
    
    let lastNameTextField: NameTextField = {
        let textField = NameTextField()
        textField.title = "Sobrenome"
        textField.placeholder = "Seu sobrenome"
        return textField
    }()
    
    let documentTextField: DocumentTextField = {
        let textField = DocumentTextField(documentType: .cpf)
        textField.title = "CPF"
        textField.placeholder = "Ex: 000.000.000-00"
        return textField
    }()
    
    let emailTextField: EmailTextField = {
        let textField = EmailTextField()
        textField.title = "Email"
        textField.placeholder = "exemplo@exemplo.com"
        return textField
    }()
    
    let passwordTextField: PasswordTextField = {
        let textField = PasswordTextField()
        textField.title = "Senha"
        textField.placeholder = "Sua senha"
        return textField
    }()
    
    let repeatPasswordTextField: PasswordTextField = {
        let textField = PasswordTextField()
        textField.title = "Repitir senha"
        textField.placeholder = "Repita sua senha"
        return textField
    }()
    
    let signupButton: BaseButton = {
        let button = BaseButton()
        button.setTitle("Cadastrar")
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .black
        validateTexteFields()
        buildHierarchy()
        setupConstraints()
        setupTargets()
        view.subviews.forEach { $0.alpha = 0 }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        appearAnimation()
    }
    
    func appearAnimation() {
        UIView.transition(with: view.self, duration: 1) {
            self.view.subviews.forEach { $0.alpha = 1 }
        }
    }
    
    private func setupTargets() {
        nameTextField.textField.addTarget(self, action: #selector(validateTexteFields), for: .editingChanged)
        lastNameTextField.textField.addTarget(self, action: #selector(validateTexteFields), for: .editingChanged)
        documentTextField.textField.addTarget(self, action: #selector(validateTexteFields), for: .editingChanged)
        emailTextField.textField.addTarget(self, action: #selector(validateTexteFields), for: .editingChanged)
        passwordTextField.textField.addTarget(self, action: #selector(validateTexteFields), for: .editingChanged)
        repeatPasswordTextField.textField.addTarget(self, action: #selector(validateTexteFields), for: .editingChanged)
        signupButton.addTarget(self, action: #selector(singupButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func validateTexteFields() {
        let validation: Bool = {
            return self.nameTextField.isValidName &&
            self.lastNameTextField.isValidName &&
            self.documentTextField.isValidDocument &&
            self.emailTextField.isValidEmail &&
            self.passwordTextField.isValidPassword &&
            self.repeatPasswordTextField.isValidPassword
        }()
        
        let passwordsMatch = FormValidator.passwordsMatch(password: passwordTextField.textField.text ?? "",
                                                          repeatedPasswords: repeatPasswordTextField.textField.text ?? "")
        
        signupButton.isEnabled = validation && passwordsMatch
    }
}

private extension SignupSceneViewController {
    
    func buildHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(nameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(documentTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(signupButton)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        documentTextField.snp.makeConstraints { make in
            make.top.equalTo(lastNameTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(documentTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        signupButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottomMargin.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
    }
    
}

private extension SignupSceneViewController {
    
    @objc func singupButtonAction() {
        let form: SignupFormModel = .init(name: nameTextField.textField.text ?? "",
                                          lastName: lastNameTextField.textField.text ?? "",
                                          cpf: documentTextField.textField.text ?? "",
                                          password: passwordTextField.textField.text ?? "")
        startLoading()
        interactor?.tryToSignup(form: form)
    }
    
}

extension SignupSceneViewController: SignupSceneViewControllerInput {
    
    func showSignupSuccess(accountNumber: String) {
        stopLoading()
        router?.showSignupSuccess(accountNumber: accountNumber)
    }
    
    func showSignupFailure(message: String) {
        stopLoading()
        router?.showSignupFailure(message: message)
    }
    
}
