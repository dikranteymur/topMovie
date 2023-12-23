//
//  ApiBackend.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import Foundation

enum ApiBackend: String {
    case authKey
    case baseUrl
    case accept
    
    func getString() -> String {
        switch self {
        case .authKey:
            return "Bearer " +
            "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMmRlYmIwOGRiYzQ5MmRiNDI3YzlmYThjODAzNTljMiIsInN1YiI6IjYzMTczOTcyN2ZjYWIzMDA5MWRkZTE4MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZezcSKiaT9A5dGwQ5oUmgXEQicX2PuKVlCsGoaDb5P4"
        case .baseUrl:
            return "https://api.themoviedb.org/3/"
        case .accept:
            return "application/json"
        }
    }
}
