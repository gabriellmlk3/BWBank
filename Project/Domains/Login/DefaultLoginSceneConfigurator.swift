//
//  DefaultLoginSceneConfigurator.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 29/05/22.
//

import Foundation

protocol LoginSceneConfigurator {
    func configured(_ viewController: LoginSceneViewController) -> LoginSceneViewController
}

final class DefaultLoginSceneConfigurator: LoginSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ viewController: LoginSceneViewController) -> LoginSceneViewController {
        let authWorker = LoginSceneAuthWorker()
        
        let presenter = LoginScenePresenter()
        presenter.viewController = viewController
        
        let interactor = LoginSceneInteractor()
        interactor.presenter = presenter
        interactor.authWorker = authWorker
        
        let router = LoginSceneRouter(sceneFactory: sceneFactory)
        router.source = viewController
        
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
