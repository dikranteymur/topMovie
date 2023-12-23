//
//  ShowsTableViewCell.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import UIKit

final class ShowsTableViewCell: UITableViewCell {
    
    private var showImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .fontBold16
        label.textColor = .colorBlack
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .fontRegular14
        label.textColor = .colorDarkGray
        label.numberOfLines = 4
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .fontLight12
        label.textColor = .colorDarkGray
        label.textAlignment = .right
        return label
    }()
    
    private var rightArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    private var descriptionDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    weak var viewModel: ShowsTableViewCellModelProtocol?
    
    func setCell(viewModel: ShowsTableViewCellModelProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

// MARK: - UILayout
extension ShowsTableViewCell {
    
    private func addSubviews() {
        addShowImageView()
        addTitleStackView()
        addDescriptionDateStackView()
        addRightArrowImageView()
    }
    
    private func addShowImageView() {
        contentView.addSubview(showImageView)
        showImageView.leadingToSuperview(offset: 16)
        showImageView.verticalToSuperview(insets: .vertical(16))
        let width = UIScreen.main.bounds.height * 0.20
        showImageView.size(.init(width: width, height: width))
    }
    
    private func addTitleStackView() {
        contentView.addSubview(titleStackView)
        titleStackView.leadingToTrailing(of: showImageView, offset: 16)
        titleStackView.centerYToSuperview()
        titleStackView.addArrangedSubview(titleLabel)
    }
    
    private func addDescriptionDateStackView() {
        titleStackView.addArrangedSubview(descriptionDateStackView)
        descriptionDateStackView.addArrangedSubview(descriptionLabel)
        descriptionDateStackView.addArrangedSubview(dateLabel)
    }
    
    private func addRightArrowImageView() {
        contentView.addSubview(rightArrowImageView)
        rightArrowImageView.leadingToTrailing(of: titleStackView, offset: 12)
        rightArrowImageView.trailingToSuperview(offset: -16)
        rightArrowImageView.centerYToSuperview()
        rightArrowImageView.size(.init(width: 24, height: 24))
    }
}

// MARK: - ConfigureContents
extension ShowsTableViewCell {
    
    private func configureContents() {
        rightArrowImageView.image = UIImage(named: "right_arrow")
        contentView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(contentViewLongTapped)))
    }
}

// MARK: - Actions
extension ShowsTableViewCell {
    @objc
    private func contentViewLongTapped() {
        print("Uzun basildi")
    }
}
