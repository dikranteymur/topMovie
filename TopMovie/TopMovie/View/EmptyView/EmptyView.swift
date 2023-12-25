//
//  EmptyView.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import UIKit

final class EmptyView: UIView {
    
    private weak var viewModel: EmptyViewModelProtocol?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 18
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.tintColor = .colorOrange
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .fontBold16
        label.textColor = .colorOrange
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setView(viewModel: EmptyViewModelProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

// MARK: - UILayout
extension EmptyView {
    
    private func addSubviews() {
        addContentView()
        addMainStackView()
    }
    
    private func addContentView() {
        addSubview(contentView)
        contentView.centerInSuperview()
    }
    
    private func addMainStackView() {
        contentView.addSubview(mainStackView)
        mainStackView.edgesToSuperview(insets: .uniform(20))
        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(titleLabel)
        imageView.size(.init(width: 48, height: 48))
    }
}

// MARK: - ConfigureContents
extension EmptyView {
    
    private func configureContents() {
        guard let viewModel = viewModel else { return }
        if let imageName = viewModel.imageName {
            imageView.image = UIImage(named: imageName)
        }
        titleLabel.text = viewModel.title
    }
}
