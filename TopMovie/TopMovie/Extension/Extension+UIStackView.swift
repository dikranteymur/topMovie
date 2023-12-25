//
//  Extension+UIStackView.swift
//  TopMovie
//
//  Created by Dikran Teymur on 25.12.2023.
//

import UIKit

extension UIStackView {
    
    func removeAllSubViews() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
        }
    }
}
