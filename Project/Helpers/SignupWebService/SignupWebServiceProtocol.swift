//
//  SignupWebServiceProtocol.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 31/05/22.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(with form: SignupFormModel, completionHandler: @escaping (Result<SignupResponseModel, SignupErrors>) -> Void)
    
}
