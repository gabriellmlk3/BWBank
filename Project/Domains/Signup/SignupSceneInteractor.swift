//
//  SignupSceneInteractor.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 02/06/22.
//

import Foundation

typealias SignupSceneInteractorInput = SignupSceneViewControllerOutput

protocol SignupSceneInteractorOutput: AnyObject {
    func showSignupSuccess(accountNumber: String)
    func showSignupFailure(message: String)
}

final class SignupSceneInteractor: SignupSceneInteractorInput {
    var presenter: SignupScenePresenterInput?
    var signupWorker: SignupSceneAuthWorker?

    func tryToSignup(form: SignupFormModel) {
        signupWorker?.makeSignup(form: form, completion: { result in
            switch result {
            case .success(let response):
                self.presenter?.showSignupSuccess(accountNumber: response.account.accountNumber)
            case .failure(let error):
                self.presenter?.showSignupFailure(message: error.localizedDescription)
            }
        })
    }
}
