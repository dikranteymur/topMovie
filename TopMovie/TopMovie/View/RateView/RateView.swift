//
//  RateView.swift
//  TopMovie
//
//  Created by Dikran Teymur on 25.12.2023.
//

import UIKit

final class RateView: UIView {
    
    private weak var viewModel: RateViewModelProtocol?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorPurple
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .colorOrange
        return imageView
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.font = .fontThin12
        label.textColor = .white
        return label
    }()
    
    private let rateCountLabel: UILabel = {
        let label = UILabel()
        label.font = .fontThin12
        label.textColor = .white
        return label
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setView(viewModel: RateViewModelProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

// MARK: - UILayout
extension RateView {
    
    private func addSubviews() {
        addContentView()
        addMainStackView()
        addLabelsStackView()
    }
    
    private func addContentView() {
        addSubview(contentView)
        contentView.edgesToSuperview()
    }
    
    private func addMainStackView() {
        contentView.addSubview(mainStackView)
        mainStackView.edgesToSuperview(insets: .uniform(8))
        mainStackView.addArrangedSubview(starImageView)
        starImageView.size(.init(width: 24, height: 24))
    }
    
    private func addLabelsStackView() {
        mainStackView.addArrangedSubview(labelsStackView)
        labelsStackView.addArrangedSubview(rateLabel)
        labelsStackView.addArrangedSubview(rateCountLabel)
    }
}

// MARK: - ConfigureContents
extension RateView {
    
    private func configureContents() {
        guard let viewModel = viewModel else { return }
        starImageView.image = UIImage(named: "star_fill")
        let text = viewModel.rate?.appending("/10")
        let attributedString = NSMutableAttributedString(string: text ?? "")
        let range = NSRange(location: 0, length: 3)
        attributedString.addAttributes([NSAttributedString.Key.font: UIFont.fontBold14], range: range)
        rateLabel.attributedText = attributedString
        rateCountLabel.text = viewModel.rateCount
    }
}
