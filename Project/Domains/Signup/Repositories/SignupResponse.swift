//
//  SignupResponse.swift
//  BWBankProject
//
//  Created by Gabriel Olbrisch on 27/09/22.
//

import Foundation

struct SignupResponse: Decodable {
    let token: String
    let account: AccountModel
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case account = "account"
    }
}

struct AccountModel: Decodable {
    let accountNumber: String
    let createdAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case accountNumber = "accountNumber"
        case createdAt = "CreatedAt"
    }
}
