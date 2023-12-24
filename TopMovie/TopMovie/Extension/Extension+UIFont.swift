//
//  Extension+UIFont.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import UIKit

extension UIFont {
    
    private enum FontsName: String {
        case thin = "Lato-Thin"
        case light = "Lato-Light"
        case regular = "Lato-Regular"
        case bold = "Lato-Bold"
    }
    
    // FontSize: 12
    class var fontThin12: UIFont {
        return UIFont(name: FontsName.thin.rawValue, size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    class var fontLight12: UIFont {
        return UIFont(name: FontsName.light.rawValue, size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    class var fontRegular12: UIFont {
        return UIFont(name: FontsName.regular.rawValue, size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    class var fontBold12: UIFont {
        return UIFont(name: FontsName.bold.rawValue, size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    // FontSize: 14
    class var fontThin14: UIFont {
        return UIFont(name: FontsName.thin.rawValue, size: 14) ?? UIFont.systemFont(ofSize: 14)
    }
    class var fontLight14: UIFont {
        return UIFont(name: FontsName.light.rawValue, size: 14) ?? UIFont.systemFont(ofSize: 14)
    }
    class var fontRegular14: UIFont {
        return UIFont(name: FontsName.regular.rawValue, size: 14) ?? UIFont.systemFont(ofSize: 14)
    }
    class var fontBold14: UIFont {
        return UIFont(name: FontsName.bold.rawValue, size: 14) ?? UIFont.systemFont(ofSize: 14)
    }
    
    // FontSize: 16
    class var fontThin16: UIFont {
        return UIFont(name: FontsName.thin.rawValue, size: 16) ?? UIFont.systemFont(ofSize: 16)
    }
    class var fontLight16: UIFont {
        return UIFont(name: FontsName.light.rawValue, size: 16) ?? UIFont.systemFont(ofSize: 16)
    }
    class var fontRegular16: UIFont {
        return UIFont(name: FontsName.regular.rawValue, size: 16) ?? UIFont.systemFont(ofSize: 16)
    }
    class var fontBold16: UIFont {
        return UIFont(name: FontsName.bold.rawValue, size: 16) ?? UIFont.systemFont(ofSize: 16)
    }
    
    // FontSize: 32
    class var fontThin32: UIFont {
        return UIFont(name: FontsName.thin.rawValue, size: 32) ?? UIFont.systemFont(ofSize: 32)
    }
    class var fontLight32: UIFont {
        return UIFont(name: FontsName.light.rawValue, size: 32) ?? UIFont.systemFont(ofSize: 32)
    }
    class var fontRegular32: UIFont {
        return UIFont(name: FontsName.regular.rawValue, size: 32) ?? UIFont.systemFont(ofSize: 32)
    }
    class var fontBold32: UIFont {
        return UIFont(name: FontsName.bold.rawValue, size: 32) ?? UIFont.systemFont(ofSize: 32)
    }
}
