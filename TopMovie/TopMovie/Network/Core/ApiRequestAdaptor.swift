//
//  ApiRequestAdaptor.swift
//  TopMovie
//
//  Created by Dikran Teymur on 23.12.2023.
//

import Alamofire

struct ApiRequestAdaptor {
    let method: HTTPMethod
    let parameters: Parameters
    let headers: HTTPHeaders
    let encoding: ParameterEncoding
    let url: String
    
    init(request: some RequestProtocol) {
        self.method = request.method.afHttpMethod
        var parameters: [String: Any] = [:]
        request.parameters.forEach({ parameters[$0.key] = $0.value })
        self.parameters = parameters
        var headers: HTTPHeaders = []
        request.headers.forEach({ headers[$0.key] = $0.value })
        self.headers = headers
        self.encoding = request.encoding.afEncoding
        self.url = request.url
    }
}

extension RequestHttpMethod {
    var afHttpMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        }
    }
}

extension RequestEncodingType {
    var afEncoding: ParameterEncoding {
        switch self {
        case .url:
            return URLEncoding.default
        case .json:
            return JSONEncoding.default
        }
    }
}
