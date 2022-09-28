//
//  HomeSceneInteractor.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 10/09/22.
//

import Foundation

typealias HomeSceneInteractorInput = HomeSceneViewControllerOutput

protocol HomeSceneInteractorOutput: AnyObject {
    func setUserData(model: UserModel)
    func showBalance(balanceValue: Double)
    func showErrorOcurred(message: String)
}

final class HomeSceneInteractor: HomeSceneInteractorInput {
    var presenter: HomeScenePresenterInput?
    var worker: HomeSceneWorker?
    
    func tryGetUserData() {
        worker?.getUserData() { [weak self] result in
            switch result {
            case .success(let userModel):
                self?.presenter?.setUserData(model: userModel)
            case .failure(let error):
                self?.presenter?.showErrorOcurred(message: error.errorMessage)
            }
        }
    }
    
    func signupBalanceListner() {
        worker?.setBalanceListner() { [weak self] result in
            switch result {
            case .success(let balance):
                self?.presenter?.showBalance(balanceValue: balance)
            case .failure(let error):
                self?.presenter?.showErrorOcurred(message: error.errorMessage)
            }
        }
    }
    
    func logoutUser() {
        
    }
}
