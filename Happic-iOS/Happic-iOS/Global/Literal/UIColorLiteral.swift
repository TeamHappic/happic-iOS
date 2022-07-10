//
//  UIColorLiteral.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/10.
//

import UIKit

extension UIColor {
    static var hp_white: UIColor {
        return UIColor(hex: "#f3f3f3")
    }
    
    static var hp_gray1: UIColor {
        return UIColor(hex: "#f9f9f9")
    }
    
    static var hp_gray2: UIColor {
        return UIColor(hex: "#f5f5f5")
    }
    
    static var hp_gray3: UIColor {
        return UIColor(hex: "#e6e6e6")
    }
    
    static var hp_gray4: UIColor {
        return UIColor(hex: "#d3d3d3")
    }
    
    static var hp_gray5: UIColor {
        return UIColor(hex: "#aeaeae")
    }
    
    static var hp_gray6: UIColor {
        return UIColor(hex: "#868686")
    }
    
    static var hp_gray7: UIColor {
        return UIColor(hex: "#585858")
    }
    
    static var hp_gray8: UIColor {
        return UIColor(hex: "#4c4c4c")
    }
    
    static var hp_gray9: UIColor {
        return UIColor(hex: "#2e2e2e")
    }
    
    static var hp_bgblack1: UIColor {
        return UIColor(hex: "#19191f")
    }
    
    static var hp_bgblack2h: UIColor {
        return UIColor(hex: "#0b0b0b")
    }
    
    static var hp_darkpurple: UIColor {
        return UIColor(hex: "#7d5b79")
    }
    
    static var hp_darkblue: UIColor {
        return UIColor(hex: "#6a5eb1")
    }
    
    static var hp_orange: UIColor {
        return UIColor(hex: "#f9956a")
    }
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
