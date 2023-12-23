//
//  RequestProtocol.swift
//  TopMovie
//
//  Created by Dikran Teymur on 22.12.2023.
//

import Foundation

protocol RequestProtocol {
    associatedtype ResponseModel: Decodable
    
    var endPoint: String { get }
    var method: RequestHttpMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncodingType { get }
    var url: String { get }
}

enum RequestEncodingType {
    case url
    case json
}

enum RequestHttpMethod: String {
    case get = "GET"
    case post = "POST"
}

typealias RequestParameters = [String: Any]
typealias RequestHeaders = [String: String]
