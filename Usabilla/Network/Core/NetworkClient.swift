//
//  NetworkClient.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 25.06.17.
//  Copyright © 2017 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct NetworkClient {
    fileprivate let requestPerformer: RequestPerformer
    
    public init(requestPerformer: RequestPerformer = NetworkRequestPerformer()) {
        self.requestPerformer = requestPerformer
    }
}

extension NetworkClient {
    @discardableResult
    func perform<T: Request>(_ request: T, completionHandler: @escaping (ResponseResult<T.ResponseObject, NetworkError>) -> Void) -> URLSessionDataTask {
        return requestPerformer.perform(request.build()) { result in
            if let data = result.data {
                if result.code == 200 {
                    do {
                        let object = try request.parse(jsonData: data)
                        completionHandler(ResponseResult(value: object, error: nil))
                    } catch {
                        completionHandler(ResponseResult(value: nil, error: .parseError(error)))
                    }
                    
                } else {
                    completionHandler(ResponseResult(value: nil, error: .serverError(code: result.code, data: result.data)))
                }
            } else if result.error != nil {
                completionHandler(ResponseResult(value: nil, error: .serverError(code: result.code, data: result.error.debugDescription.data(using: .utf8))))
            }
        }
    }
}
