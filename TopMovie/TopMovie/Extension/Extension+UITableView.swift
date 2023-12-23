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
    
    func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T? {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else { return nil }
        return cell
    }
}
