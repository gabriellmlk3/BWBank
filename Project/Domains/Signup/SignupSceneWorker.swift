//
//  SignupSceneWorker.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 02/06/22.
//

import Foundation
import KickoffService

protocol SignupSceneSignupLogic {
    func makeSignup(form: SignupFormModel, completion: @escaping (Result<SignupResponse, RequestError>) -> Void)
}

final class SignupSceneAuthWorker: SignupSceneSignupLogic {
    
    private let networkManager = NetworkManager()
    
    func makeSignup(form: SignupFormModel, completion: @escaping (Result<SignupResponse, RequestError>) -> Void) {
        networkManager.execute(request: SignupTarget.signup(request: form)) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
}

