//
//  PopularMoviesRequest.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import Foundation

struct PopularShowsRequest: ApiRequest {
    typealias ResponseModel = PopularShowsModel
    
    var endPoint: String = ""
    var method: RequestHttpMethod = .get
    var parameters: RequestParameters = [:]
    
    init(page: Int = 1) {
        endPoint = "tv/popular"
        parameters["page"] = page
        addLanguageParameter()
    }
    
    private mutating func addLanguageParameter() {
        guard let preferredIdentifier = Locale.preferredLanguages.first else { return }
        let localeIdentifier = Locale(identifier: preferredIdentifier).identifier(.bcp47)
        parameters["language"] = localeIdentifier
    }
}
