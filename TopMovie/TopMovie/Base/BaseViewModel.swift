//
//  BaseViewModel.swift
//  TopMovie
//
//  Created by Dikran Teymur on 21.12.2023.
//

import Foundation

protocol BaseViewModelProtocol {
    var service: AppService? { get }
}

class BaseViewModel: BaseViewModelProtocol {
    var service: AppService?
    
    init(service: AppService? = nil) {
        self.service = service
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
