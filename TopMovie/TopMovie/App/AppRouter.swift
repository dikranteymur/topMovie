//
//  Approuter.swift
//  TopMovie
//
//  Created by Dikran Teymur on 21.12.2023.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        // TODO: - will adding HomeViewController
        window.makeKeyAndVisible()
    }
}
