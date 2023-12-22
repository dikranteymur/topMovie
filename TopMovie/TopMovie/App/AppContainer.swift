//
//  AppContainer.swift
//  TopMovie
//
//  Created by Dikran Teymur on 21.12.2023.
//

import UIKit

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = AppService()
}
