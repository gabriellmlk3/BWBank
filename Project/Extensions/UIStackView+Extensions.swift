//
//  UIStackView+Extensions.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 12/09/22.
//

import Foundation
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ subviews: [UIView]) {
            subviews.forEach { addArrangedSubview($0) }
        }
    
}
