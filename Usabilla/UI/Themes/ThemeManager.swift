//
//  ThemeManager.swift
//  Usabilla
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

class ThemeManager {
    static var currentTheme: Theme {
        get {
            return .light
        }
    }
    
    static func apply(_ theme: Theme) {
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.mainColor
        
        UIApplication.shared.statusBarStyle = theme.barStyle
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = theme.mainColor
        UINavigationBar.appearance().backgroundColor = theme.mainColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        UITabBar.appearance().backgroundColor = UIColor.white
        
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-200, 0), for:UIBarMetrics.default)
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
    }
}
