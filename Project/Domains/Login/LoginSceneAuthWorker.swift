//
//  LoginSceneAuthWorker.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 29/05/22.

import Foundation
import KickoffService

protocol LoginSceneAuthLogic {
    func makeAuth(form: LoginFormModel, completion: @escaping (Result<LoginResponse, RequestError>) -> Void)
}

final class LoginSceneAuthWorker {
    
    private let networkManager = NetworkManager()

}

extension LoginSceneAuthWorker: LoginSceneAuthLogic {
    func makeAuth(form: LoginFormModel, completion: @escaping (Result<LoginResponse, RequestError>) -> Void) {
        networkManager.execute(request: LoginTarget.login(request: form)) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
