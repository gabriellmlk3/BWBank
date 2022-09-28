//
//  CustomTabBarItem.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 12/09/22.
//

import Foundation
import UIKit

enum CustomTabItem: String, CaseIterable {
    case home
}
 
extension CustomTabItem {
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return UINavigationController(rootViewController: SceneFactory().makeHomeScene() ?? UIViewController())
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysTemplate)
        }
    }
    
    var selectedIcon: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")?.withTintColor(.black, renderingMode: .alwaysTemplate)
        }
    }
    
    var name: String {
        return self.rawValue.capitalized
    }
    
}
