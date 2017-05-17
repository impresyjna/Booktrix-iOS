//
//  SignUpInputValidator.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

enum SignUpInputValidatorError: Error {
    case EmptyLogin
    case EmptyEmail
    case EmptyPassword
    case PasswordsDoNotMatch
    case NameWithBadSigns
    case SurnameWithBadSigns
}

struct SignUpInputValidator {
    
    // MARK: - Interface
    
    func validateLogin(login: String?) throws {
        guard let login = login, !login.isEmpty else {
            throw SignUpInputValidatorError.EmptyLogin
        }
    }
    
    func validatePassword(password: String?) throws {
        guard let password = password, !password.isEmpty else {
            throw SignUpInputValidatorError.EmptyPassword
        }
    }
    
    func validateEmail(email: String?) throws {
        guard let email = email, !email.isEmpty else {
            throw SignUpInputValidatorError.EmptyEmail
        }
    }
    
    func validatePasswordAndConfirmation(password: String?, confirmation: String?) throws {
        guard let password = password, let confirmation = confirmation, password == confirmation else {
            throw SignUpInputValidatorError.PasswordsDoNotMatch
        }
    }
}
