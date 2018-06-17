//
//  ViewReusable.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

protocol ViewReusable: class {
    static var defaultReuseIdentifier: String { get }
}

extension ViewReusable where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
