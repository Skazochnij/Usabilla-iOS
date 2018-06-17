//
//  NibLoadable.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIViewController {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension NibLoadable where Self: UIView { //TODO
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
