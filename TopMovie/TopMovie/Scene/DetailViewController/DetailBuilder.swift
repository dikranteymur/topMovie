//
//  DetailBuilder.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import UIKit

final class DetailBuilder {
    static func make(model: PopularShowsResultsModel?) -> DetailViewController {
        let viewModel = DetailViewModel(model: model)
        let viewController = DetailViewController(viewModel: viewModel)
        return viewController
    }
}
