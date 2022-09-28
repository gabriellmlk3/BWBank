//
//  SignupScenePresenter.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 02/06/22.
//

import Foundation

typealias SignupScenePresenterOutput = SignupSceneViewControllerInput
typealias SignupScenePresenterInput = SignupSceneInteractorOutput

final class SignupScenePresenter: SignupScenePresenterInput {
    weak var viewController: SignupScenePresenterOutput?
    
    func showSignupFailure(message: String) {
        viewController?.showSignupFailure(message: message)
    }
    
    func showSignupSuccess(accountNumber: String) {
        viewController?.showSignupSuccess(accountNumber: accountNumber)
    }
}
