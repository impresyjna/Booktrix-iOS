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

enum CategoryBackground : UInt32 {
    case white = 0xFFFFFFff
    case flax = 0xe1dd8fff
    case paleCarmine = 0xb0413eff
    case tangoPink = 0xe0777dff
    case cyanAzure = 0x4c86a8ff
    case queenBlue = 0x477890ff
    case laurelGreen = 0xb9baa3ff
    case lightGray = 0xd6d5c9ff
    case lightCyan = 0xd9f7faff
    case grullo = 0xaba194ff
    case azureishWhite = 0xc7e8f3ff
    case pastelViolet = 0xbf9acaff
    case kobi = 0xeda2c0ff
    case deer = 0xb88b4aff
    case burlywood = 0xddca7dff
    case viridian = 0x3f826dff
    case rosyBrown = 0xbd8b9cff
    case turtleGreen = 0x8a9b68ff
    case pastelGray = 0xd5ddbcff
    case artichoke = 0x869d7aff
}

extension UIColor {
    convenience init(_ name: NotificationBackground) {
        let rgbaValue = name.rawValue
        self.init(rgbaValue)
    }
    
    convenience init(_ name: CategoryBackground) {
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
