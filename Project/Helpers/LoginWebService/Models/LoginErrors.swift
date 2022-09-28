//
//  LoginErrors.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 10/09/22.
//

import Foundation

enum LoginErrors: Error {
    case serverBadRequest(message: String, status: Int)
    
    var errorMessage: String {
        switch self {
        case .serverBadRequest(let message, let status):
            return "\(message) - Status: \(status)"
        }
    }
}
