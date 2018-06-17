//
//  Result.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 25.06.17.
//  Copyright © 2017 Aleksey Kornienko. All rights reserved.
//

import Foundation

public struct ResponseResult<Value, Error: Swift.Error> {
    var value: Value?
    var error: Error?
}
