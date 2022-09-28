//
//  BaseButton.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import Foundation
import UIKit

class BaseButton: UIButton {
    
    var isInverted: Bool = false {
        didSet {
            self.setupButton()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.setupButton()
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        let attributedTitle = NSMutableAttributedString(string: title)
        attributedTitle.addAttributes([.font: UIFont.systemFont(ofSize: 20, weight: .bold),
                                       .foregroundColor: isInverted ? UIColor.white : UIColor.black],
                                      range: NSRange(location: 0, length: attributedTitle.length))
        setAttributedTitle(attributedTitle, for: .normal)
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor = isEnabled ? isInverted ? .clear : .white : .white.withAlphaComponent(0.3)
        layer.cornerRadius = 5
        layer.borderColor = isInverted ? UIColor.white.cgColor : UIColor.clear.cgColor
        layer.borderWidth = isInverted ? 2 : 0
        clipsToBounds = true
    }
    
}
