//
//  SignupSceneRouter.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 04/06/22.
//

import Foundation

import UIKit

protocol SignupSceneRoutingLogic {
    func showSignupSuccess(accountNumber: String)
    func showSignupFailure(message: String)
}

final class SignupSceneRouter: SignupSceneRoutingLogic {
    weak var source: UIViewController?
    
    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }

    func showSignupFailure(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
        source?.present(alert, animated: true)
    }
    
    func showSignupSuccess(accountNumber: String) {
        let alert = UIAlertController(title: "Sucesso!", message: "Sua conta foi criada. O número da sua conta é \(accountNumber)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
        source?.present(alert, animated: true)
    }
    
}

