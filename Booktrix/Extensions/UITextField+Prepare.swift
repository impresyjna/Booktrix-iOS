//
//  UITextView+Prepare.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//
import UIKit

extension UITextField {
    internal func prepareForView(_ borderColor: UIColor = AppColor.textViewBorderColor) {
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = borderColor.cgColor
    }
}
