//
//  DetailViewController.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import UIKit
import SDWebImage

final class DetailViewController: BaseViewController<DetailViewModel> {
    
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let backdropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let rateView = RateView()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .fontRegular12
        label.textColor = .white
        return label
    }()
    
    private let rateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 12
        return stackView
    }()
    
    private let genreScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let genreStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .fontBold32
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .fontRegular14
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 12
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
    }
    
    override func setBackgroundColor() -> UIColor {
        return .colorDarkGray
    }
}

// MARK: - UILayout
extension DetailViewController {
    
    private func addSubviews() {
        addMainScrollView()
        addBackdropImageView()
        addRateStackView()
        addGenreScrollView()
        addGenreStackView()
        addLabelStackView()
    }
    
    private func addMainScrollView() {
        view.addSubview(mainScrollView)
        mainScrollView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        mainScrollView.bottomToSuperview()
    }
    
    private func addBackdropImageView() {
        mainScrollView.addSubview(backdropImageView)
        backdropImageView.edgesToSuperview(excluding: .bottom)
        backdropImageView.width(UIScreen.main.bounds.width)
        backdropImageView.height(UIScreen.main.bounds.height * 0.25)
    }
    
    private func addRateStackView() {
        mainScrollView.addSubview(rateStackView)
        rateStackView.topToBottom(of: backdropImageView, offset: 20)
        rateStackView.leadingToSuperview(offset: 16)
        rateStackView.addArrangedSubview(rateView)
        rateStackView.addArrangedSubview(dateLabel)
    }
    
    private func addGenreScrollView() {
        mainScrollView.addSubview(genreScrollView)
        genreScrollView.topToBottom(of: rateStackView, offset: 20)
        genreScrollView.horizontalToSuperview(insets: .horizontal(16))
        genreScrollView.height(26)
    }
    
    private func addGenreStackView() {
        genreScrollView.addSubview(genreStackView)
        genreStackView.edgesToSuperview()
    }
    
    private func addLabelStackView() {
        mainScrollView.addSubview(labelStackView)
        labelStackView.topToBottom(of: genreScrollView, offset: 20)
        labelStackView.horizontalToSuperview(insets: .horizontal(16))
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(descriptionLabel)
        labelStackView.bottomToSuperview()
    }
}

// MARK: - ConfigureContents
extension DetailViewController {
    
    private func configureContents() {
        configureNavigationBar()
        configureBackdropImageView()
        configureRateView()
        configureGenreView()
        configureLabels()
    }
    
    private func configureNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        guard let model = viewModel.model else { return }
        navigationItem.title = model.name
    }
    
    private func configureBackdropImageView() {
        backdropImageView.sd_setImage(with: viewModel.getBackdropImageUrl(), placeholderImage: UIImage(named: "empty_image"))
    }
    
    private func configureRateView() {
        guard let model = viewModel.model else { return }
        rateView.setView(viewModel: RateViewModel(voteAverage: model.voteAverage, voteCount: model.voteCount))
        dateLabel.text = model.firstAirDate?.toDateString
    }
    
    private func configureGenreView() {
        genreStackView.removeAllSubViews()
        viewModel.getGenreNames().forEach { name in
            let genreView = GenreView()
            genreView.setView(viewModel: GenreViewModel(title: name))
            genreStackView.addArrangedSubview(genreView)
        }
    }
    
    private func configureLabels() {
        guard let model = viewModel.model else { return }
        titleLabel.text = model.name
        descriptionLabel.text = model.overview
    }
}
