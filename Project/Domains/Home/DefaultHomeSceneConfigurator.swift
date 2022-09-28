//
//  DefaultHomeSceneConfigurator.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 10/09/22.
//

import Foundation

protocol HomeSceneConfigurator {
    func configured() -> HomeSceneViewController
}

final class DefaultHomeSceneConfigurator: HomeSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured() -> HomeSceneViewController {
        let authWorker = HomeSceneWorker()
        let presenter = HomeScenePresenter()
        let interactor = HomeSceneInteractor()
        interactor.presenter = presenter
        interactor.worker = authWorker
        
        let viewController = HomeSceneViewController(interactor: interactor)
        let router = HomeSceneRouter(sceneFactory: sceneFactory)
        router.source = viewController
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
