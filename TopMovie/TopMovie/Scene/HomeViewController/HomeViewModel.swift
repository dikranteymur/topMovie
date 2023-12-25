//
//  HomeViewModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 21.12.2023.
//

import Foundation

protocol HomeViewModelEvents {
    var reloadData: VoidClosure? { get }
    var showFooterView: BoolClosure? { get }
    var handleEmptyView: BoolClosure? { get }
    var navigate: AnyClosure<PopularShowsResultsModel>? { get }
}

protocol HomeViewModelProtocol: HomeViewModelEvents {
    var numberOfItems: Int? { get }
    
    func didLoad()
    func cellForItemAt(indexPath: IndexPath) -> ShowsTableViewCellModelProtocol
    func loadShowsWithPagination()
    func didSelectRowAt(indexPath: IndexPath)
}

final class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    // Events
    var reloadData: VoidClosure?
    var showFooterView: BoolClosure?
    var handleEmptyView: BoolClosure?
    var navigate: AnyClosure<PopularShowsResultsModel>?
    
    // Privates
    private var page: Int = 1
    private var canPagination: Bool = false
    private var popularShowItems: [ShowsTableViewCellModelProtocol] = []
    private var popularShows: [PopularShowsResultsModel] = []
    
    // DataSource
    var numberOfItems: Int? {
        return popularShowItems.count
    }
    
    func didLoad() {
        loadShows()
    }
    
    func cellForItemAt(indexPath: IndexPath) -> ShowsTableViewCellModelProtocol {
        return popularShowItems[indexPath.row]
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        navigate?(popularShows[indexPath.row])
    }
    
    private func loadShows() {
        let request = PopularShowsRequest(page: 1)
        app.service.request(with: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                configureCellItems(results: response.results ?? [])
                reloadData?()
                self.page += 1
                self.canPagination = true
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func loadShowsWithPagination() {
        if canPagination {
            canPagination = false
            showFooterView?(true)
            let request = PopularShowsRequest(page: page)
            app.service.request(with: request) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    configureCellItems(results: response.results ?? [])
                    reloadData?()
                    showFooterView?(false)
                    self.page += 1
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

// MARK: - Configures
extension HomeViewModel {
    
    private func configureCellItems(results: [PopularShowsResultsModel]) {
        popularShows.append(contentsOf: results)
        popularShowItems.append(contentsOf: results.map({ ShowsTableViewCellModel(model: $0) }))
        canPagination = !results.isEmpty
        handleEmptyView?(results.isEmpty)
    }
}
