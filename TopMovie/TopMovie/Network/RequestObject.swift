//
//  RequestObject.swift
//  TopMovie
//
//  Created by Dikran Teymur on 22.12.2023.
//

import Alamofire

protocol RequestObjectProtocol {
    var endPoint: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: EncodingType { get }
    var url: String { get }
}

struct RequestObject {
    let method: HTTPMethod
    var parameters: RequestParameters
    let headers: RequestHeaders
    let encoding: ParameterEncoding
    var url: String = ""
    
    init(request: some RequestObjectProtocol) {
        self.method = request.method
        self.parameters = request.parameters
        self.headers = request.headers
        self.encoding = request.encoding.afEncoding
        self.url = request.url
    }
}

enum EncodingType {
    case url
    case json
    
    var afEncoding: ParameterEncoding {
        switch self {
        case .url: 
            return URLEncoding.default
        case .json: 
            return JSONEncoding.default
        }
    }
}

typealias RequestParameters = [String: Any]
typealias RequestHeaders = [String: String]
