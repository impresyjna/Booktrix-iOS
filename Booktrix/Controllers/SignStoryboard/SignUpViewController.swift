//
//  SignUpViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var loginTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var passwordConfirmationTextView: UITextField!
    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var surnameTextView: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        prepareFields()
    }
    
    func prepareFields() {
        loginTextView.prepareForView()
        passwordTextView.prepareForView()
        passwordConfirmationTextView.prepareForView()
        nameTextView.prepareForView()
        surnameTextView.prepareForView()
    }

    @IBAction func openSignInView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
