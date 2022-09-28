//
//  LoginSceneRouter.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 29/05/22.
//

import Foundation
import UIKit

protocol LoginSceneRoutingLogic {
    func pushHome()
    func showLogingFailure(message: String)
    func pushSignupViewController()
}

final class LoginSceneRouter: LoginSceneRoutingLogic {
    weak var source: UIViewController?
    
    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    func pushSignupViewController() {
        guard let controller = sceneFactory.makeSignupScene() else { return }
        source?.navigationController?.navigationBar.tintColor = .white
        source?.navigationController?.pushViewController(controller, animated: true)
    }

    func showLogingFailure(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        source?.present(alert, animated: true)
    }
    
    func pushHome() {
        let controller = CustomTabBarController()
        controller.modalPresentationStyle = .fullScreen
        source?.navigationController?.navigationBar.tintColor = .white
        source?.navigationController?.present(controller, animated: true)
    }
}
