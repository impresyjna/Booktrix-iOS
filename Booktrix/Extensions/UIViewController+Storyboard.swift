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
    
    func presentViewFromStoryboard(storyboardName: String, viewName: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let newView = storyBoard.instantiateViewController(withIdentifier: viewName)
        self.present(newView, animated: true, completion: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func jump(toNextTextField textField: UITextField, withTag tag: Int) {
        // Gets the next responder from the view. Here we use self.view because we are searching for controls with
        // a specific tag, which are not subviews of a specific views, because each textfield belongs to the
        // content view of a static table cell.
        //
        // In other cases may be more convenient to use textField.superView, if all textField belong to the same view.
        if let nextResponder = self.view.viewWithTag(tag) {
            if (nextResponder is UITextField) {
                // If there is a next responder and it is a textfield, then it becomes first responder.
                nextResponder.becomeFirstResponder()
            }
            else {
                // If there is not then removes the keyboard.
                textField.resignFirstResponder()
            }
        } else {
            dismissKeyboard()
        }
    }
}
