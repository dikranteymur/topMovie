//
//  RateViewModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 25.12.2023.
//

import Foundation

protocol RateViewModelProtocol: AnyObject {
    var rate: String? { get }
    var rateCount: String? { get }
}

final class RateViewModel: RateViewModelProtocol {
    
    var rate: String?
    var rateCount: String?
    
    init(rate: String? = nil, rateCount: String? = nil) {
        self.rate = rate
        self.rateCount = rateCount
    }
}

// MARK: - Convenience Init
extension RateViewModel {
    
    convenience init(voteAverage: Float?, voteCount: Int?) {
        self.init(rate: voteAverage?.numberFormatterWith(fractionDigit: 1), rateCount: voteCount?.formatted())
    }
}
