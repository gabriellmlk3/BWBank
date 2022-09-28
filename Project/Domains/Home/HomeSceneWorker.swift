//
//  HomeSceneWorker.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 10/09/22.
//

import Foundation

protocol HomeSceneWorkerLogic {
    func getUserData(completion: @escaping (Result<UserModel, HomeSceneWorker.HomeSceneWorkerError>) -> Void)
    func setBalanceListner(completion: @escaping (Result<Double, HomeSceneWorker.HomeSceneWorkerError>) -> Void)
    func logoutUser()
}

final class HomeSceneWorker {
    
    enum HomeSceneWorkerError: Error {
        case getUserDataFailed(String)
        case setBalanceListnerFailer(String)
        case unauthorized
        
        var errorMessage: String {
            switch self {
            case .getUserDataFailed(let message):
                return message
            case .setBalanceListnerFailer(let message):
                return message
            case .unauthorized:
                return "Não Autorizado"
            }
        }
    }
}

extension HomeSceneWorker: HomeSceneWorkerLogic {
    
    func logoutUser() {
        
    }
    
    func setBalanceListner(completion: @escaping (Result<Double, HomeSceneWorker.HomeSceneWorkerError>) -> Void) {
        
    }
    
    func getUserData(completion: @escaping (Result<UserModel, HomeSceneWorker.HomeSceneWorkerError>) -> Void) {
        
    }
    
}
