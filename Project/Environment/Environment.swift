//
//  Environment.swift
//  BWBankProject
//
//  Created by Gabriel Olbrisch on 27/09/22.
//

import Foundation

public enum PlistKey: String {
    case baseUrl = "BASE_URL"
    
    var value: String {
        let environment = Environment.shared
        
        switch self {
        case .baseUrl:
            return environment.infoDict[rawValue] as? String ?? ""
        }
    }
}

struct Environment {
    
    static let shared = Environment()
    
    fileprivate var infoDict: [String: Any]  {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            } else {
                fatalError("Plist file not found")
            }
        }
    }
    
}
