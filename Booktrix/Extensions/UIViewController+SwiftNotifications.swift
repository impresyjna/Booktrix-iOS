//
//  UIViewController+SwiftNotifications.swift
//  Booktrix
//
//  Created by Impresyjna on 18.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit
import SwiftyNotifications

extension UIViewController {
    enum NotificationStyle {
        case normal
        case error
        case success
        case info
        case warning
        case custom
    }
    
    private func showNotification(title: String?, subtitle: String?, dismissDelay: Double, style: SwiftyNotificationsStyle) {
        let notification = SwiftyNotifications.withStyle(style: style,
                                                         title: title ?? "",
                                                         subtitle: subtitle ?? "",
                                                         dismissDelay: dismissDelay)
        self.view.addSubview(notification)
        notification.show()
    }
    
    func showWarning(title: String?, subtitle: String?, dismissDelay: Double) {
        showNotification(title: title, subtitle: subtitle, dismissDelay: dismissDelay, style: .warning)
    }
    
    func showError(title: String?, subtitle: String?, dismissDelay: Double) {
        showNotification(title: title, subtitle: subtitle, dismissDelay: dismissDelay, style: .error)
    }
}
