//
//  UITextView+Prepare.swift
//  Booktrix
//
//  Created by Impresyjna on 07.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

extension UITextView {
    func prepareForView(_ borderColor: UIColor = TextViewConfiguration.textViewBorderColor,
                        backgroundColor: UIColor = TextViewConfiguration.textViewBackgroundColor,
                        borderWidth: CGFloat = TextViewConfiguration.textViewBorderWidth,
                        cornerRadius: CGFloat = TextViewConfiguration.textViewCornerRadius) {
        self.backgroundColor = backgroundColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
    }
}
