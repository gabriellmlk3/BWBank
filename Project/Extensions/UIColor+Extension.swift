//
//  UIColor+Extension.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import Foundation
import UIKit

extension UIColor {
    
    public class var lightRed1: UIColor? { return UIColor(hex: "#8f2631") }
    public class var lightRed2: UIColor? { return UIColor(hex: "#712030") }
    public class var mediumRed: UIColor? { return UIColor(hex: "#551c2e") }
    public class var darkRed1: UIColor? { return UIColor(hex: "#37182e") }
    public class var darkRed2: UIColor? { return UIColor(hex: "#1b172d") }
    public class var darkGray: UIColor? { return UIColor(hex: "#363636") }
    
}

extension UIColor {
    
    public convenience init?(hex: String) {
            let r, g, b, a: CGFloat

            if hex.hasPrefix("#") {
                let hexColor = hex.replacingOccurrences(of: "#", with: "")

                if hexColor.count == 7 {
                    let scanner = Scanner(string: hexColor)
                    var hexNumber: UInt64 = 0

                    if scanner.scanHexInt64(&hexNumber) {
                        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                        a = CGFloat(hexNumber & 0x000000ff) / 255

                        self.init(red: r, green: g, blue: b, alpha: a)
                        return
                    }
                }
            }

            return nil
        }
    
}
