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
        viewModel.form.login = loginTextField.text ?? ""
        viewModel.form.password = passwordTextField.text ?? ""
        viewModel.form.confirmation = passwordConfirmationTextField.text ?? ""
        viewModel.form.name = nameTextField.text ?? ""
        viewModel.form.surname = surnameTextField.text ?? ""
        viewModel.form.email = emailTextField.text ?? ""
    }
    
    @IBAction func openSignInView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        viewModel.register { (result) in
            switch result {
            case .success(let result):
                break
            case .failure(let error as ValidationError):
                self.showError(title: nil, subtitle: error.message, dismissDelay: 3.0)
            default:
                break
            }
        }
//        showHud()
    }
    
    @IBAction func navigateThroughInputs(_ sender: UITextField) {
        let nextTag = sender.tag + 1;
        self.jump(toNextTextField: sender, withTag: nextTag)
    }

}
