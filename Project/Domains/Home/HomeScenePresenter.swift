//
//  HomeScenePresenter.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 10/09/22.
//

import Foundation

typealias HomeScenePresenterOutput = HomeSceneViewControllerInput
typealias HomeScenePresenterInput = HomeSceneInteractorOutput

final class HomeScenePresenter: HomeScenePresenterInput {
    weak var viewController: HomeScenePresenterOutput?
    
    func setUserData(model: UserModel) {
        viewController?.setUserData(model: model)
    }
    
    func showBalance(balanceValue: Double) {
        viewController?.showBalance(balanceValue: balanceValue)
    }
    
    func showErrorOcurred(message: String) {
        viewController?.showErrorOcurred(message: message)
    }
}
