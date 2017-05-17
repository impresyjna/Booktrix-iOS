//
//  SignUpViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

import UIKit

struct SignUpForm {
    var name: String?
    var surname: String?
    var login: String?
    var email: String?
    var password: String?
    var confirmation: String?
}

protocol SignUpViewModelProtocol {
    
    weak var delegate: SignUpViewControllerDelegate? { get set }
    
    var loginBorderColor: UIColor? { get }
    var passwordBorderColor: UIColor? { get }
    var passwordConfirmationBorderColor: UIColor? { get }
    var nameBorderColor: UIColor? { get }
    var surnameBorderColor: UIColor? { get }
    var emailBorderColor: UIColor? { get }
    
    var submitTextColor: UIColor { get }
    var submitEnabled: Bool { get }
    
    func submitButtonPressed()
    func loginTextDidChangeToText(text: String?)
    func passwordTextDidChangeToText(text: String?)
    func passwordConfirmationTextDidChangeToText(text: String?)
    func nameTextDidChangeToText(text: String?)
    func surnameTextDidChangeToText(text: String?)
    func emailTextDidChangeToText(text: String?)
}

protocol SignUpViewControllerDelegate: class {
    func reloadViews()
    func goToActivityPage()
}

struct SignUpViewModel: SignUpViewModelProtocol {
    weak var delegate: SignUpViewControllerDelegate?
    
    internal var usernameValid : Bool = true
    internal var submitEnabled : Bool = true
    
    var loginBorderColor: UIColor? {
        return usernameValid ? UIColor.black : UIColor.red
    }
    
    var passwordBorderColor: UIColor? {
        return usernameValid ? UIColor.black : UIColor.red
    }
    
    var passwordConfirmationBorderColor: UIColor? {
        return usernameValid ? UIColor.black : UIColor.red
    }
    
    var nameBorderColor: UIColor? {
        return usernameValid ? UIColor.black : UIColor.red
    }
    
    var emailBorderColor: UIColor? {
        return usernameValid ? UIColor.black : UIColor.red
    }
    
    var surnameBorderColor: UIColor? {
        return usernameValid ? UIColor.black : UIColor.red
    }
    
    var submitTextColor: UIColor {
        return submitEnabled ? UIColor.black : UIColor.lightGray
    }
    
    var submitEnabled: Bool {
        return usernameValid //&& passwordValid
    }
    
    // MARK: - Actions
    
    func submitButtonPressed() {
        do {
            try registrationInputValidator.validateUsername(usernameText)
            try registrationInputValidator.validatePassword(passwordText)
            
            tellDelegateToMoveToHomeScreen()
        } catch {
            print("Danger Will Robinson! Danger!")
        }
    }
    
    func usernameTextDidChangeToText(text: String?) {
        usernameText = text ?? ""
        
        do {
            try registrationInputValidator.validateUsername(usernameText)
            usernameValid = true
        } catch {
            usernameValid = false
        }
        
        delegateReloadViews()
    }
    
    func passwordTextDidChangeToText(text: String?) {
        passwordText = text ?? ""
        
        do {
            try registrationInputValidator.validatePassword(passwordText)
            passwordValid = true
        } catch {
            passwordValid = false
        }
        
        delegateReloadViews()
    }
    
    // MARK: - Delegate Response
    
    private func delegateSignUpAction() {
        delegate?.goToActivityPage()
    }
    
    private func delegateReloadViews() {
        delegate?.reloadViews()
    }
    
}
