//
//  LoginSceneViewController.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import UIKit

protocol LoginSceneViewControllerInput: AnyObject {
    func pushHome()
    func showLogingFailure(message: String)
}

protocol LoginSceneViewControllerOutput: AnyObject {
    func tryToLogIn(form: LoginFormModel)
}

final class LoginSceneViewController: BaseViewController {
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "BWLogoTemplate"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    let accountNumberTextField: AccountNumberTextField = {
        let textField = AccountNumberTextField()
        textField.title = "Número da conta"
        textField.placeholder = "Ex: 000.00000-00"
        return textField
    }()
    
    let passwordTextField: PasswordTextField = {
        let textField = PasswordTextField()
        textField.title = "Senha"
        textField.placeholder = "Sua senha"
        return textField
    }()
    
    let entryButton: BaseButton = {
        let button = BaseButton()
        button.setTitle("Entrar")
        return button
    }()
    
    let signUpButton: BaseButton = {
        let button = BaseButton()
        button.isInverted = true
        button.setTitle("Abra uma conta")
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        let attributedTitle = NSMutableAttributedString(string: "Esqueceu a senha?")
        attributedTitle.addAttributes([.font: UIFont.systemFont(ofSize: 15, weight: .bold),
                                       .foregroundColor: UIColor.white],
                                      range: NSRange(location: 0, length: attributedTitle.length))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    var interactor: LoginSceneInteractorInput?
    var router: LoginSceneRoutingLogic?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .black
        navigationItem.backButtonTitle = ""
        setAlphas(number: 0)
        validateTextFields()
        setupTargets()
        buildHierarchy()
        setupConstraints()
//        setTestAccountIfDebug()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopLoading()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        appearAnimation()
    }
    
    private func setupTargets() {
        accountNumberTextField.textField.addTarget(self, action: #selector(validateTextFields), for: .editingChanged)
        passwordTextField.textField.addTarget(self, action: #selector(validateTextFields), for: .editingChanged)
        signUpButton.addTarget(self, action: #selector(signUpButtonDidTapped), for: .touchUpInside)
        entryButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func validateTextFields() {
        let validation = accountNumberTextField.isValidAccount && passwordTextField.isValidPassword
        entryButton.isEnabled = validation
    }
    
    @objc
    private func signUpButtonDidTapped() {
        router?.pushSignupViewController()
    }
    
    private func setTestAccountIfDebug() {
        #if DEBUG
        accountNumberTextField.textField.text = "395.36445-25"
        passwordTextField.textField.text = "00000000"
        validateTextFields()
        #endif
    }
    
    func appearAnimation() {
        UIView.animate(withDuration: 1) {
            self.logoImageView.snp.remakeConstraints { make in
                make.top.equalToSuperview().offset(100)
                make.height.equalTo(165)
                make.leading.trailing.equalToSuperview()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                UIView.transition(with: self.view, duration: 1) {
                    self.setAlphas(number: 1)
                }
            }
            self.view.layoutIfNeeded()
        }
    }
    
    func setAlphas(number: CGFloat) {
        accountNumberTextField.alpha = number
        passwordTextField.alpha = number
        entryButton.alpha = number
        signUpButton.alpha = number
        forgotPasswordButton.alpha = number
    }
}

private extension LoginSceneViewController {
    
    func buildHierarchy() {
        view.addSubview(logoImageView)
        view.addSubview(accountNumberTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(entryButton)
        view.addSubview(signUpButton)
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(165)
            make.leading.trailing.equalToSuperview()
        }
        
        accountNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(accountNumberTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        entryButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottomMargin.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(entryButton.snp.top).offset(-20)
            make.height.equalTo(45)
        }
    }
    
}

private extension LoginSceneViewController {
    
    @objc func loginButtonAction() {
        let loginForm = LoginFormModel(accountNumber: accountNumberTextField.textField.text ?? "", password: passwordTextField.textField.text ?? "")
        startLoading()
        interactor?.tryToLogIn(form: loginForm)
    }
    
}

extension LoginSceneViewController: LoginSceneViewControllerInput {
    
    func pushHome() {
        router?.pushHome()
    }
    
    func showLogingFailure(message: String) {
        router?.showLogingFailure(message: message)
        stopLoading()
    }
    
}
