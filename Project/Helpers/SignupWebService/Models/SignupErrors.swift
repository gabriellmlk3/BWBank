//
//  SignupErrors.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 31/05/22.
//

import Foundation

enum SignupErrors: Error {
    case serverBadRequest(message: String, status: Int)
    
    var errorMessage: String {
        switch self {
        case .serverBadRequest(let message, let status):
            return "\(message) - Status: \(status)"
        }
    }
}
