//
//  NetworkRequestPerformer.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 25.06.17.
//  Copyright © 2017 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct NetworkRequestPerformer: RequestPerformer {
    fileprivate let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
}

extension NetworkRequestPerformer {
    func perform(_ request: URLRequest, completionHandler: @escaping (_ response: Response) -> Void) -> URLSessionDataTask {
//        print("Request:\n\tURL:\(request.url?.absoluteString ?? "")\n\tPOST:\(String(data: request.httpBody ?? "".data(using: .utf8)!, encoding: .utf8) ?? "")")
        let task = session.dataTask(with: request) { data, response, error in
            let rawResponse = response as? HTTPURLResponse
//            if (data != nil) {
//                print("Response\n\t[\(rawResponse?.statusCode ?? 500)]: \(String(data: data!, encoding:.utf8) ?? "")")
//            }
            
            let object = Response(code: rawResponse?.statusCode ?? 500, data: data, error: error)
            completionHandler(object)
        }
        
        task.resume()
        return task
    }
}
