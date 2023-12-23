//
//  HomeBuilder.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import UIKit

final class HomeBuilder {
    static func make() -> HomeViewController {
        let viewModel = HomeViewModel(service: app.service)
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
