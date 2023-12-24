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
        imageView.layer.borderColor = UIColor.colorOrange.cgColor
        imageView.layer.borderWidth = 4
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .fontBold16
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .fontRegular14
        label.textColor = .white
        label.numberOfLines = 3
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .fontLight12
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    private var rightArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .colorOrange
        return imageView
    }()
    
    private var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 12
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
        addMainStackView()
        addLabelsStackView()
    }
    
    private func addMainStackView() {
        contentView.addSubview(mainStackView)
        mainStackView.edgesToSuperview(insets: .uniform(16))
        mainStackView.addArrangedSubview(showImageView)
        mainStackView.addArrangedSubview(labelsStackView)
        mainStackView.addArrangedSubview(rightArrowImageView)
        showImageView.size(.init(width: 110, height: 110))
    }
    
    private func addLabelsStackView() {
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(dateLabel)
        labelsStackView.addArrangedSubview(descriptionLabel)
    }
}

// MARK: - ConfigureContents
extension ShowsTableViewCell {
    
    private func configureContents() {
        backgroundColor = .colorDarkGray
        selectionStyle = .none
        contentView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(contentViewLongTapped(_:))))
        rightArrowImageView.image = UIImage(named: "right_arrow")
        showImageView.image = UIImage(named: "empty_image")
        titleLabel.text = viewModel?.title
        descriptionLabel.text = viewModel?.description
        dateLabel.text = viewModel?.date
    }
}

// MARK: - Actions
extension ShowsTableViewCell {
    @objc
    private func contentViewLongTapped(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.ended {
            print("Uzun Basildi")
            return
        }
    }
}
