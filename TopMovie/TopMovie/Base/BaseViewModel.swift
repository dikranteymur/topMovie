//
//  BaseViewModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 21.12.2023.
//

import Foundation

protocol BaseViewModelProtocol {
    
}

class BaseViewModel: BaseViewModelProtocol {
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
