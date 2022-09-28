//
//  UIFonts+Extension.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import Foundation
import UIKit

extension UIFont {
    
    public class func VDSLightItalic(ofSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "VDS-ThinItalic", size: ofSize) else { return UIFont.systemFont(ofSize: ofSize, weight: .regular) }
        return font
    }
    
    public class func railroadGothicCC(ofSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "RailroadGothicCC", size: ofSize) else { return UIFont.systemFont(ofSize: ofSize, weight: .bold) }
        return font
    }
}

