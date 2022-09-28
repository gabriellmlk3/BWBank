//
//  LoginSceneInteractor.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 29/05/22.
//

import Foundation

typealias LoginSceneInteractorInput = LoginSceneViewControllerOutput

protocol LoginInteractorOutput: AnyObject {
    func pushHome()
    func showLogingFailure(message: String)
}

final class LoginSceneInteractor: LoginSceneInteractorInput {
    var presenter: LoginScenePresenterInput?
    var authWorker: LoginSceneAuthLogic?

    func tryToLogIn(form: LoginFormModel) {
        authWorker?.makeAuth(form: form, completion: { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let response):
                    AuthHelper.shared.authToken = response.token
                    self?.presenter?.pushHome()
                case .failure(let error):
                    self?.presenter?.showLogingFailure(message: error.localizedDescription)
                }
            }
        })
    }
}
