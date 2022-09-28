//
//  AuthHelper.swift
//  BWBankProject
//
//  Created by Gabriel Olbrisch on 28/09/22.
//

import Foundation

final class AuthHelper {
    
    static var shared: AuthHelper = .init()
    
    var authToken: String?
}
