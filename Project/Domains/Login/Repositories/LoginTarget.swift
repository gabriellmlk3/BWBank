//
//  LoginTarget.swift
//  BWBankProject
//
//  Created by Gabriel Olbrisch on 28/09/22.
//

import Foundation
import KickoffService

enum LoginTarget {
    case login(request: LoginFormModel)
}

extension LoginTarget: NetworkTarget {
    
    var baseURL: URLComponents {
        guard let baseURL = URLComponents(string: PlistKey.baseUrl.value) else {
            fatalError("Can not convert string to URL")
        }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .login:
            return "/account/login"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .login(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login(let request):
            let loginString = String(format: "%@:%@", request.accountNumber, request.password)
            let loginData = loginString.data(using: String.Encoding.utf8)
            let basicToken = loginData?.base64EncodedString()
            
            return ["Content-Type" : "application/json",
                    "Authorization" : "Basic \(basicToken ?? "")"]
        }
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
}
