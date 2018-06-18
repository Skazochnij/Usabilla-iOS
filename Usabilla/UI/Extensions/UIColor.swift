//
//  UIColor.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

extension UIColor {
    open static let green: UIColor = UIColor(rgb: 0x5BC584)
    open static let orange: UIColor = UIColor(rgb: 0xDB682E)
    open static let diserria: UIColor = UIColor(rgb: 0xDCA851)
    open static let pelorous: UIColor = UIColor(rgb: 0x49A3C5)
    open static let shuttlegray: UIColor = UIColor(rgb: 0x555D65)
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

