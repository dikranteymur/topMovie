//
//  Extension+UITableView.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Cell not found: \(String(describing: T.self))")
        }
        return cell
    }
    
    func showFooterView() {
        let view = UIView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.style = .large
        spinner.color = .colorOrange
        view.addSubview(spinner)
        spinner.centerInSuperview()
        spinner.startAnimating()
        tableFooterView = view
    }
    
    func removeFooterView() {
        tableFooterView = nil
    }
}
