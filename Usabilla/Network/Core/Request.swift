//
//  Request.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 25.06.17.
//  Copyright © 2017 Aleksey Kornienko. All rights reserved.
//

import Foundation

protocol Request  {
    associatedtype ResponseObject
    
    func build() -> URLRequest
    func parse(jsonData: Data) throws -> ResponseObject
}
