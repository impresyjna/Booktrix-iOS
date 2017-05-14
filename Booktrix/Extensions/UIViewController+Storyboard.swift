//
//  UIViewController+Storyboard.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

extension UIViewController {
    func pushViewFromStoryboard(storyboardName: String, viewName: String) {
        self.navigationController?.pushViewController(UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: viewName) as UIViewController, animated: true)
        
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
