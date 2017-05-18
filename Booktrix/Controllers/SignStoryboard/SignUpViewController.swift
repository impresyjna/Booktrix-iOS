//
//  SignUpViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    var viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        prepareFields()
    }
    
    func prepareFields() {
        loginTextField.prepareForView()
        passwordTextField.prepareForView()
        passwordConfirmationTextField.prepareForView()
        nameTextField.prepareForView()
        surnameTextField.prepareForView()
        emailTextField.prepareForView()
    }

    @IBAction func textFieldChanged(_ sender: Any) {
        //TODO: Validation here to enable button
//        viewModel.login = loginTextField.text
//        viewModel.password = passwordTextField.text
//        viewModel.confirmation = passwordConfirmationTextField.text
//        viewModel.name = nameTextField.text
//        viewModel.surname = surnameTextField.text
//        viewModel.email = emailTextField.text
    }
    
    @IBAction func openSignInView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        viewModel.register { (result) in
            
        }
//        showHud()
    }
    
    @IBAction func navigateThroughInputs(_ sender: UITextField) {
        let nextTag = sender.tag + 1;
        self.jump(toNextTextField: sender, withTag: nextTag)
    }

}
