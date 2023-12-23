//
//  ApiRequest.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import Foundation

protocol ApiRequest: RequestProtocol {}

extension ApiRequest {
    var encoding: RequestEncodingType {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

extension ApiRequest {
    var url: String {
        return ApiBackend.baseUrl.getString() + endPoint
    }
}

extension ApiRequest {
    var headers: RequestHeaders {
        var headers: [String: String] = [:]
        headers["accept"] = ApiBackend.accept.getString()
        headers["Authorization"] = ApiBackend.authKey.getString()
        return headers
    }
}
