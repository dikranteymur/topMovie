//
//  EmptyViewModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import Foundation

protocol EmptyViewModelProtocol: AnyObject {
    var imageName: String? { get }
    var title: String? { get }
}

final class EmptyViewModel: EmptyViewModelProtocol {
    var imageName: String?
    var title: String?
    
    init(imageName: String? = nil, title: String? = nil) {
        self.imageName = imageName
        self.title = title
    }
}
