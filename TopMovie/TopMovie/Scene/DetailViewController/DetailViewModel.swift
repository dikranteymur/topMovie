//
//  DetailViewModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import Foundation

protocol DetailViewModelProtocol {
    var model: PopularShowsResultsModel? { get }
    func getGenreNames() -> [String]
    func getBackdropImageUrl() -> URL?
}

final class DetailViewModel: BaseViewModel, DetailViewModelProtocol {
    
    var model: PopularShowsResultsModel?
    
    init(model: PopularShowsResultsModel? = nil) {
        self.model = model
    }
    
    func getGenreNames() -> [String] {
        guard let genreIds = model?.genreIds else { return [] }
        return genreIds.compactMap({ GenreIdNames(rawValue: $0)?.genreName })
    }
    
    func getBackdropImageUrl() -> URL? {
        guard let backdropPath = model?.backdropPath else { return nil }
        return URL(string: ApiBackend.imageUrl.getString().appending(backdropPath))
    }
}
