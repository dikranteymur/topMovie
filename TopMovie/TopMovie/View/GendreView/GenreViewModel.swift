//
//  GenreViewModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import Foundation

protocol GenreViewModelProtocol: AnyObject {
    var title: String? { get }
}

final class GenreViewModel: GenreViewModelProtocol {
    
    var title: String?
    
    init(title: String? = nil) {
        self.title = title
    }
}
