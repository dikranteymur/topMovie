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
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(ShowsTableViewCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        addObservers()
        viewModel.didLoad()
    }
    
    override func setBackgroundColor() -> UIColor {
        return .colorDarkGray
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubviews() {
        view.addSubview(tableView)
        tableView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        tableView.bottomToSuperview()
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        navigationItem.title = "Popular TV Shows"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.tintColor = .white
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY > (tableView.contentSize.height - scrollView.frame.size.height) + 150 {
            viewModel.loadShowsWithPagination()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShowsTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.setCell(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
}

// MARK: - Observers
extension HomeViewController {
    
    private func addObservers() {
        
        viewModel.showFooterView = { [weak self] status in
            guard let self = self else { return }
            status ? self.tableView.showFooterView() : self.tableView.removeFooterView()
        }
        
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
        viewModel.handleEmptyView = { [weak self] status in
            guard let self = self else { return }
            let emptyView = EmptyView()
            emptyView.setView(viewModel: EmptyViewModel(imageName: "error_image", title: "Bir Hata Olustu!"))
            emptyView.addShadow()
            if status {
                self.tableView.backgroundView = emptyView
            } else {
                self.tableView.backgroundColor = nil
            }
        }
    }
}
