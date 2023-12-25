//
//  GenreView.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import UIKit

final class GenreView: UIView {
    
    private weak var viewModel: GenreViewModelProtocol?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .colorPurple
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .fontBold12
        label.textColor = .white
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
    
    func setView(viewModel: GenreViewModelProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

// MARK: - UILayout
extension GenreView {
    
    private func addSubviews() {
        addContentView()
        addTitleLabel()
    }
    
    private func addContentView() {
        addSubview(contentView)
        contentView.edgesToSuperview()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.horizontalToSuperview(insets: .horizontal(8))
        titleLabel.verticalToSuperview(insets: .vertical(4))
    }
}

// MARK: - ConfigureContents
extension GenreView {
    
    private func configureContents() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
    }
}

enum GenreIdNames: Int {
    case actionAndAdventure = 10759
    case animation = 16
    case comedy = 35
    case crime = 80
    case documentary = 99
    case drama = 18
    case family = 10751
    case kids = 10762
    case mystery = 9648
    case news = 10763
    case reality = 10764
    case scifiAndFantasy = 10765
    case soap = 10766
    case talk = 10767
    case warAndPolitics = 10768
    case western = 37
    
    var genreName: String {
        switch self {
        case .actionAndAdventure: return "Aksiyon & Macera"
        case .animation: return "Animasyon"
        case .comedy: return "Komedi"
        case .crime: return "Suc"
        case .documentary: return "Belgesel"
        case .drama: return "Dram"
        case .family: return "Aile"
        case .kids: return "Cocuk"
        case .mystery: return "Gizem"
        case .news: return "Haberler"
        case .reality: return "Realiti Show"
        case .scifiAndFantasy: return "Bilim Kurgu & Fantazi"
        case .soap: return "Pembe Dizi"
        case .talk: return "Acik Oturum"
        case .warAndPolitics: return "Politika"
        case .western: return "Western"
        }
    }
}
