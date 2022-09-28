//
//  LoginFormModel.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 04/06/22.
//

import Foundation

struct LoginFormModel: Codable {
    let accountNumber: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case accountNumber = "accountNumber"
        case password = "password"
    }
}
