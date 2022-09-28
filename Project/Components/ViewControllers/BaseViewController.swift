//
//  BaseViewController.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 12/09/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    private let backgroundBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0
        return blurEffectView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.alpha = 0
        return activityIndicator
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .black
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        view.addSubview(backgroundBlurView)
        backgroundBlurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        UIView.transition(with: view, duration: 0.5) {
            self.backgroundBlurView.alpha = 1
            self.activityIndicator.alpha = 1
        }
        
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        UIView.transition(with: view, duration: 0.5) {
            self.backgroundBlurView.alpha = 0
            self.activityIndicator.alpha = 0
        }
        
        backgroundBlurView.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
    
}
