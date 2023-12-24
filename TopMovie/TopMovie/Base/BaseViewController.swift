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
        view.backgroundColor = setBackgroundColor()
        setNavigationBarTitle()
    }
    
    func setBackgroundColor() -> UIColor {
        return .white
    }
    
    func setNavigationBarTitle() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .colorPurple.withAlphaComponent(0.8)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.colorOrange, .font: UIFont.fontThin32]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.fontThin16]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
