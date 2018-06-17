//
//  Theme.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

enum Theme: Int {
    case light
    
    var mainColor: UIColor {
        switch self {
        case .light:
            return UIColor.pelorous
        }
    }
    
    var barStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
