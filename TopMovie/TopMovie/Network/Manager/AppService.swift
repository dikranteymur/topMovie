//
//  AppService.swift
//  TopMovie
//
//  Created by Dikran Teymur on 22.12.2023.
//

import Foundation
import Alamofire

typealias ResponseResult<T: Decodable> = (Result<T, Error>) -> Void

protocol AppServiceProtocol {
    mutating func request<T: RequestProtocol>(with requestObject: T, result: ResponseResult<T.ResponseModel>?)
}

struct AppService: AppServiceProtocol {
    
    private lazy var session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 15
        return Session(configuration: configuration)
    }()
    
    mutating func request<T: RequestProtocol>(with requestObject: T, result: ResponseResult<T.ResponseModel>?) {
        let request = createRequest(request: requestObject)
        request?.responseDecodable(of: T.ResponseModel.self, completionHandler: { response in
            switch response.result {
            case .success(let value):
                result?(.success(value))
            case .failure(let error):
                result?(.failure(error))
            }
        })
    }
}

extension AppService {
    
    private mutating func createRequest(request: some RequestProtocol) -> DataRequest? {
        let adapter = ApiRequestAdaptor(request: request)
        return session.request(adapter.url,
                               method: adapter.method,
                               parameters: adapter.parameters,
                               encoding: adapter.encoding,
                               headers: adapter.headers).validate()
    }
}
