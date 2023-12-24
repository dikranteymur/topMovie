//
//  Extension+UIView.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import UIKit

extension UIView {
    
    func addShadow(color: UIColor = .black, 
                   offset: CGSize = .init(width: 4, height: 4),
                   radius: CGFloat = 16,
                   opacity: Float = 0.85) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
}
