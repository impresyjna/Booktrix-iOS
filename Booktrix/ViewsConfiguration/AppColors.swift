//
//  AppColors.swift
//  Booktrix
//
//  Created by Impresyjna on 31.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

enum NotificationBackground : UInt32 {
    case warning = 0xFFA000ff
    case error = 0xD32F2Fff
    case success = 0x388E3Cff
}

extension UIColor {
    convenience init(_ name: NotificationBackground) {
        let rgbaValue = name.rawValue
        self.init(rgbaValue)
    }
    
    convenience init(_ rgbaValue: UInt32) {
        let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
        let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
        let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
        let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
