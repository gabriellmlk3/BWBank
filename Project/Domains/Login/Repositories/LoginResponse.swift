//
//  LoginResponse.swift
//  BWBankProject
//
//  Created by Gabriel Olbrisch on 28/09/22.
//

import Foundation

struct LoginResponse: Decodable {
    let token: String
    let account: AccountModel
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case account = "account"
    }
    
}
