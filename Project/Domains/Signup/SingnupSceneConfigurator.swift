//
//  c.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 04/06/22.
//

import Foundation

protocol SingnupSceneConfigurator {
    func configured(_ viewController: SignupSceneViewController) -> SignupSceneViewController
}

final class DefaultSignupSceneConfigurator: SingnupSceneConfigurator {
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ viewController: SignupSceneViewController) -> SignupSceneViewController {
//        let service = SignupWebServiceMock()
        let signupWorker = SignupSceneAuthWorker()
        
        let presenter = SignupScenePresenter()
        presenter.viewController = viewController
        
        let interactor = SignupSceneInteractor()
        interactor.presenter = presenter
        interactor.signupWorker = signupWorker
        
        let router = SignupSceneRouter(sceneFactory: sceneFactory)
        router.source = viewController
        
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
    
}
