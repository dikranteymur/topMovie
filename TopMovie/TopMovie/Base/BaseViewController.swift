//
//  BaseViewController.swift
//  TopMovie
//
//  Created by Dikran Teymur on 21.12.2023.
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
    }
    
    func setBackgroundColor(_ color: UIColor? = nil) {
        guard let color = color else {
            view.backgroundColor = .white
            return
        }
        view.backgroundColor = color
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
