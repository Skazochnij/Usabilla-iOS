//
//  String.swift
//  Usabilla
//
//  Created by Aleksey Kornienko on 15/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

extension String {
    func urlString() -> String {
        if (self.hasPrefix("https:") || self.hasPrefix("http:")) {
            return self
        }
        return "https:\(self)"
    }
}
