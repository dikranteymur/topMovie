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
    var date: Date? { get }
}

final class ShowsTableViewCellModel: ShowsTableViewCellModelProtocol {
    var imageUrl: URL?
    var title: String?
    var description: String?
    var date: Date?
    
    init(imageUrl: URL? = nil, 
         title: String? = nil,
         description: String? = nil,
         date: Date? = nil) {
        self.imageUrl = imageUrl
        self.title = title
        self.description = description
        self.date = date
    }
}
