//
//  SignInViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        prepareFields()
    }
    
    func prepareFields() {
        loginTextField.prepareForView()
        passwordTextField.prepareForView()
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        viewModel.form.login = loginTextField.text ?? ""
        viewModel.form.password = passwordTextField.text ?? ""
    }
    
    //MARK: Button actions
    @IBAction func openSignUp(_ sender: Any) {
        self.presentViewFromStoryboard(controller: Wireframe.SignUpView().signUp())
    }
    
    @IBAction func signInAction(_ sender: Any) {
        self.showHud()
        viewModel.login { [weak self] (result) in
            self?.hideHud()
            switch result {
            case .success(_):
                self?.presentViewFromStoryboard(controller: Wireframe.ActivitiesView().activities())
            case .failure(let error as ValidationError):
                self?.showWarning(title: nil, subtitle: error.message, dismissDelay: 3.0)
            case .failure(let error as HTTPError):
                self?.showError(title: nil, subtitle: error.message, dismissDelay: 3.0)
            default:
                break
            }
        }
    }
    
    @IBAction func navigateThroughInputs(_ sender: UITextField) {
        let nextTag = sender.tag + 1;
        jump(toNextTextField: sender, withTag: nextTag)
    }
}
