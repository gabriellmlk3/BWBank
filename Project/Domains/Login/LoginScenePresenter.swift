//
//  LoginScenePresenter.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 29/05/22.
//

import Foundation

typealias LoginScenePresenterOutput = LoginSceneViewControllerInput
typealias LoginScenePresenterInput = LoginInteractorOutput

final class LoginScenePresenter: LoginScenePresenterInput {
    weak var viewController: LoginScenePresenterOutput?

    func showLogingFailure(message: String) {
        viewController?.showLogingFailure(message: message)
    }
    
    func pushHome() {
        viewController?.pushHome()
    }
}
