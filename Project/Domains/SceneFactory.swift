//
//  SceneFactory.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 29/05/22.
//

import Foundation
import UIKit

final class SceneFactory {
    
    func makeLoginScene() -> LoginSceneViewController? {
        let configurator = DefaultLoginSceneConfigurator(sceneFactory: self)
        let scene = LoginSceneViewController()
        return configurator.configured(scene)
    }
    
    func makeSignupScene() -> SignupSceneViewController? {
        let configurator = DefaultSignupSceneConfigurator(sceneFactory: self)
        let scene = SignupSceneViewController()
        return configurator.configured(scene)
    }
    
    func makeHomeScene() -> HomeSceneViewController? {
        return DefaultHomeSceneConfigurator(sceneFactory: self).configured()
    }
    
}
