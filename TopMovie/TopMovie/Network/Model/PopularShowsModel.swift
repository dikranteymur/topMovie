//
//  PopularShowsModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import Foundation

struct PopularShowsModel: Decodable {
    var results: [PopularShowsResultsModel]?
}

struct PopularShowsResultsModel: Decodable {
    var backdropPath: String?
    var originalName: String?
    var overview: String?
    var posterPath: String?
    var firstAirDate: String?
    var voteAverage: Float?
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
    }
}
