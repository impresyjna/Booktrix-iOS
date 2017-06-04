//
//  UIViewController+SwiftNotifications.swift
//  Booktrix
//
//  Created by Impresyjna on 18.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit
import BRYXBanner

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
