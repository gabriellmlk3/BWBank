//
//  SignupTarget.swift
//  BWBankProject
//
//  Created by Gabriel Olbrisch on 27/09/22.
//

import Foundation
import KickoffService

enum SignupTarget {
    case signup(request: SignupFormModel)
}

extension SignupTarget: NetworkTarget {
    
    var baseURL: URLComponents {
        guard let baseURL = URLComponents(string: PlistKey.baseUrl.value) else {
            fatalError("Can not convert string to URL")
        }
        return baseURL
    }
    
    var path: String {
        switch self {
        case .signup:
            return "/account/signup"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .signup:
            return .post
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .signup(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
}
