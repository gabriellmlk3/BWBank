//
//  LoginWebServiceMock.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 10/09/22.
//

import Foundation

final class LoginWebServiceMock: LoginWebServiceProtocol {
    
    func login(with form: LoginFormModel, completionHandler: @escaping (Result<LoginResponseModel, LoginErrors>) -> Void) {
        
    }

}
