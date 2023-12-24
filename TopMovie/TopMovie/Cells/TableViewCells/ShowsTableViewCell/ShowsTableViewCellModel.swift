//
//  ShowsTableViewCellModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import Foundation

protocol ShowsTableViewCellModelEvents: AnyObject {
    
}

protocol ShowsTableViewCellModelProtocol: ShowsTableViewCellModelEvents {
    var imageUrl: URL? { get }
    var title: String? { get }
    var description: String? { get }
    var date: String? { get }
}

final class ShowsTableViewCellModel: ShowsTableViewCellModelProtocol {
    var imageUrl: URL?
    var title: String?
    var description: String?
    var date: String?
    
    init(imageUrl: URL? = nil, 
         title: String? = nil,
         description: String? = nil,
         date: String? = nil) {
        self.imageUrl = imageUrl
        self.title = title
        self.description = description
        self.date = date
    }
}

// MARK: - Convenience Init
extension ShowsTableViewCellModel {
    
    convenience init(model: PopularShowsResultsModel) {
        self.init(imageUrl: URL(string: model.posterPath ?? ""),
                  title: model.name,
                  description: model.overview,
                  date: model.firstAirDate?.toDateString)
    }
}
