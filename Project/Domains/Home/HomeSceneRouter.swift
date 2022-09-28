//
//  HomeSceneRouter.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 10/09/22.
//

import Foundation
import UIKit

protocol HomeSceneRoutingLogic {
    func showLeaveConfirmationAlert(completion: @escaping () -> Void)
    func showErrorOcurred(message: String)
}

final class HomeSceneRouter: HomeSceneRoutingLogic {
    weak var source: UIViewController?
    
    private let sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }

    func showErrorOcurred(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
        source?.present(alert, animated: true)
    }

    func showLeaveConfirmationAlert(completion: @escaping () -> Void) {
        let alert = UIAlertController(title: "Atenção", message: "Você sairá da sua sessão atual. Deseja realmente sair?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Não", style: .default, handler: { _ in }))
        alert.addAction(UIAlertAction(title: "Sair", style: .destructive, handler: { [weak self] _ in
            completion()
            self?.leave()
        }))
        source?.present(alert, animated: true)
    }
    
    private func leave() {
        source?.dismiss(animated: true)
    }
    
}
