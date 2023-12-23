//
//  Extension+UIColor.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import UIKit

extension UIColor {
    
    private enum ColorsName: String {
        case black = "black"
        case darkGray = "gray"
        case orange = "orange"
        case purple = "purple"
    }
    
    class var colorBlack: UIColor {
        return UIColor(named: ColorsName.black.rawValue) ?? .black
    }
    
    class var colorDarkGray: UIColor {
        return UIColor(named: ColorsName.darkGray.rawValue) ?? .darkGray
    }
    
    class var colorOrange: UIColor {
        return UIColor(named: ColorsName.orange.rawValue) ?? .orange
    }
    
    class var colorPurple: UIColor {
        return UIColor(named: ColorsName.purple.rawValue) ?? .purple
    }
}
