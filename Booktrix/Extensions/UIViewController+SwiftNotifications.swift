//
//  UIViewController+SwiftNotifications.swift
//  Booktrix
//
//  Created by Impresyjna on 18.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit
import SwiftyNotifications
import BRYXBanner

enum NotificationBackground : UInt32 {
    case warning = 0xFFA000ff
    case error = 0xD32F2Fff
    case success = 0x388E3Cff
}

extension UIViewController {
    private func showNotification(title: String?, subtitle: String?, dismissDelay: Double, style: NotificationBackground) {
        let banner = Banner(title: title, subtitle: subtitle, image: nil, backgroundColor: UIColor(style))
        banner.dismissesOnTap = true
        banner.show(duration: 3.0)
    }
    
    func showWarning(title: String?, subtitle: String?, dismissDelay: Double) {
        showNotification(title: title, subtitle: subtitle, dismissDelay: dismissDelay, style: .warning)
    }
    
    func showError(title: String?, subtitle: String?, dismissDelay: Double) {
        showNotification(title: title, subtitle: subtitle, dismissDelay: dismissDelay, style: .error)
    }
    
    func showSuccess(title: String? ,subtitle: String?, dismissDelay: Double) {
        showNotification(title: title, subtitle: subtitle, dismissDelay: dismissDelay, style: .success)
    }
}

fileprivate extension UIColor {
    convenience init(_ name: NotificationBackground) {
        let rgbaValue = name.rawValue
        let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
        let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
        let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
        let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
