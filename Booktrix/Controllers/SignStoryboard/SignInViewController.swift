//
//  SignInViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        prepareFields()
    }
    
    func prepareFields() {
        loginTextField.prepareForView()
        passwordTextField.prepareForView()
    }
    
    //MARK: Button actions
    @IBAction func openSignUp(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "SignUpView", bundle: nil)
        let signUpViewController = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(signUpViewController, animated: true, completion: nil)
    }
    
    @IBAction func navigateThroughInputs(_ sender: UITextField) {
        print("Hello")
        let nextTag = sender.tag + 1;
        self.jump(toNextTextField: sender, withTag: nextTag)
    }
}
