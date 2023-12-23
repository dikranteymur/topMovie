//
//  HomeViewController.swift
//  TopMovie
//
//  Created by Dikran Teymur on 21.12.2023.
//

import UIKit
import TinyConstraints

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsHorizontalScrollIndicator = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        viewModel.loadShows()
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubviews() {
        
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        navigationItem.title = "Popular TV Shows"
    }
}
