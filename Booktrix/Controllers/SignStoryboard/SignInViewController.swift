//
//  SignInViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTextField(loginTextField)
        prepareTextField(passwordTextField)
        // Do any additional setup after loading the view.
    }
    
    func prepareTextField(_ textField: UITextField) {
        let borderColor = UIColor(red:0.99, green:0.89, blue:0.65, alpha:1.0)
        textField.backgroundColor = UIColor.clear
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = borderColor.cgColor
    }

}
