//
//  UIViewController+Storyboard.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

extension UIViewController {
    func pushViewFromStoryboard(controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func presentViewFromStoryboard(controller: UIViewController) {
        self.present(controller, animated: true, completion: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setNewRoot(controller: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController = controller
    }
    
    func jump(toNextTextField textField: UITextField, withTag tag: Int) {
        if let nextResponder = self.view.viewWithTag(tag) {
            if (nextResponder is UITextField) {
                nextResponder.becomeFirstResponder()
            }
            else {
                textField.resignFirstResponder()
            }
        } else {
            dismissKeyboard()
        }
    }
}
