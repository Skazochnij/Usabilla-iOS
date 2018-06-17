//
//  RequestPerformer.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 25.06.17.
//  Copyright © 2017 Aleksey Kornienko. All rights reserved.
//

import Foundation

protocol RequestPerformer {
    func perform(_ request: URLRequest, completionHandler: @escaping (_ response: Response) -> Void) -> URLSessionDataTask
}
