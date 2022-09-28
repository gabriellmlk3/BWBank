//
//  UILabel+Extensions.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 12/09/22.
//

import Foundation
import UIKit

extension UILabel {
    
    func configureWith(_ text: String, color: UIColor, alignment: NSTextAlignment, size: CGFloat, weight: UIFont.Weight = .regular) {
            self.font = .systemFont(ofSize: size, weight: weight)
            self.text = text
            self.textColor = color
            self.textAlignment = alignment
        }
    
}
