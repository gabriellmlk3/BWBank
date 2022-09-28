//
//  SignupFormModel.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 31/05/22.
//

import Foundation

struct SignupFormModel: Encodable {
    let name: String
    let lastName: String
    let cpf: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case name = "firstName"
        case lastName = "lastName"
        case cpf = "cpf"
        case password = "password"
    }
}
