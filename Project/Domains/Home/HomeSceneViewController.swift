//
//  HomeSceneViewController.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 10/09/22.
//

import Foundation
import UIKit
import RxSwift
import RxGesture

protocol HomeSceneViewControllerInput: AnyObject {
    func setUserData(model: UserModel)
    func showBalance(balanceValue: Double)
    func showErrorOcurred(message: String)
}

protocol HomeSceneViewControllerOutput: AnyObject {
    func logoutUser()
    func tryGetUserData()
    func signupBalanceListner()
}

final class HomeSceneViewController: BaseViewController {
    var interactor: HomeSceneInteractorInput
    var router: HomeSceneRoutingLogic?
    
    private var userNameTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.railroadGothicCC(ofSize: 40)
        return label
    }()
    
    private var leaveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.leaveIcon
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var balanceTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "Seu saldo:"
        return label
    }()
    
    private var balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.railroadGothicCC(ofSize: 20)
        return label
    }()
    
    private let disposeBag = DisposeBag()
    
    init(interactor: HomeSceneInteractorInput) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        buildHierarchy()
        setupConstraints()
        bind()
//        self.view.subviews.forEach { $0.alpha = 0 }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.tryGetUserData()
        interactor.signupBalanceListner()
        appearAnimation()
    }
    
    func appearAnimation() {
        UIView.transition(with: view.self, duration: 1) {
            self.view.subviews.forEach { $0.alpha = 1 }
        }
    }
    
    private func bind() {
        leaveImageView.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                self?.router?.showLeaveConfirmationAlert() {
                    self?.interactor.logoutUser()
                }
            }
            .disposed(by: disposeBag)
    }
}

private extension HomeSceneViewController {
    
    func buildHierarchy() {
        view.addSubview(userNameTitleLabel)
        view.addSubview(leaveImageView)
        view.addSubview(balanceTitleLabel)
        view.addSubview(balanceLabel)
    }
    
    func setupConstraints() {
        userNameTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().inset(16)
        }
        
        leaveImageView.snp.makeConstraints { make in
            make.centerY.equalTo(userNameTitleLabel)
            make.leading.greaterThanOrEqualTo(userNameTitleLabel.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.size.equalTo(40)
        }
        
        balanceTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameTitleLabel.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
}

extension HomeSceneViewController: HomeSceneViewControllerInput {
    
    func setUserData(model: UserModel) {
        self.userNameTitleLabel.text = "Olá \(model.firstName),"
        self.appearAnimation()
    }
    
    func showBalance(balanceValue: Double) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve) { [balanceLabel] in
            balanceLabel.text = balanceValue.inCurrency()
        }
    }
    
    func showErrorOcurred(message: String) {
        router?.showErrorOcurred(message: message)
    }
    
}
