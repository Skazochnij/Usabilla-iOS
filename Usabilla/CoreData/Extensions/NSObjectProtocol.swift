//
//  NSObjectProtocol.swift
//  ArWall
//
//  Created by Aleksey Kornienko on 10/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

extension NSObjectProtocol {
    static var name: String {
        return String(describing: Self.self)
    }
}
