//
//  HomeViewModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 21.12.2023.
//

import Foundation

protocol HomeViewModelEvents {
    
}

protocol HomeViewModelProtocol {
    func loadShows()
    func loadShowsWith(page: Int)
}

final class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    
    func loadShows() {
        let request = PopularShowsRequest(page: 1)
        app.service.request(with: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print("Response: \(response)")
                print("ok")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func loadShowsWith(page: Int) {
        
    }
}
