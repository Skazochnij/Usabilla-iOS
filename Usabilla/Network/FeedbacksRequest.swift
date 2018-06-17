//
//  UsabillaRequest.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct FeedbacksRequest: Request {
    typealias ResponseObject = FeedbacksResponse
    
    func build() -> URLRequest {
        let url = URL(string: "http://cache.usabilla.com/example/apidemo.json")
        return URLRequest(url: url!)
    }
    
    func parse(jsonData: Data) throws -> FeedbacksResponse {
        return try JSONDecoder().decode(FeedbacksResponse.self, from: jsonData)
    }
}
