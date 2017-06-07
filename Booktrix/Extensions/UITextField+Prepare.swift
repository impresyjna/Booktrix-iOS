//
//  UITextView+Prepare.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//
import UIKit

extension UITextField {
    func prepareForView(borderColor: UIColor = TextFieldConfiguration.textFieldBorderColor,
                        backgroundColor: UIColor = TextFieldConfiguration.textFieldBackgroundColor,
                        borderWidth: CGFloat = TextFieldConfiguration.textFieldBorderWidth,
                        cornerRadius: CGFloat = TextFieldConfiguration.textFieldCornerRadius) {
        self.backgroundColor = backgroundColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
    }
    
    func innerViewsLook() {
        self.prepareForView(borderColor: TextFieldConfiguration.textFieldInnerBorderColor)
    }
}
