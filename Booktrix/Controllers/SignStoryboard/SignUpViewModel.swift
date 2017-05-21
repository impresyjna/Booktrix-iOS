//
//  SignUpViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//


import UIKit

struct SignUpForm {
    var name: String
    var surname: String
    var login: String
    var email: String
    var password: String
    var confirmation: String
}

final class SignUpViewModel {
    var form: SignUpForm
    

    typealias SignUpCompletion = (ApiResponse<User>) -> ()
    
    init() {
        form = SignUpForm(name: "", surname: "", login: "", email: "", password: "", confirmation: "")
    }
    
    func register(completion: @escaping SignUpCompletion) {
        let service = UserService()
        
        let status = FieldValidationName(name: LocalizedString.name, validationResult: form.name.validate(.nameFormat)).result.combine([
            FieldValidationName(name: LocalizedString.surname, validationResult: form.surname.validate(.nameFormat)).result,
            FieldValidationName(name: LocalizedString.email, validationResult: form.email.validate(.nonEmpty, .emailFormat)).result,
            FieldValidationName(name: LocalizedString.password, validationResult: form.password.validate(.nonEmpty, .atLeast(6))).result,
            FieldValidationName(name: LocalizedString.confirmation, validationResult: form.confirmation.validate(.matching(form.password), .nonEmpty)).result,
            FieldValidationName(name: LocalizedString.login, validationResult: form.login.validate(.nonEmpty)).result
        ])
        
        switch status {
        case .success:
            service.register(with: form, completion: { (result) in
                switch result {
                case .success(let user):
                    KeychainStorage().setUser(user)
                    completion(.success(user))
                case .codeFailure(var error):
                    switch error.code {
                    case 409:
                        error.message = LocalizedString.emailOrLoginFailure
                    default:
                        error.message = LocalizedString.serverError
                    }
                    completion(.failure(error))
                default:
                    completion(.failure(ErrorWithCode(message: LocalizedString.serverError, code: 500)))
                }
            })
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
}

fileprivate extension LocalizedString {
    static let name = NSLocalizedString("booktrix.user.form.name", comment: "Name")
    static let surname = NSLocalizedString("booktrix.user.form.surname", comment: "Surname")
    static let email = NSLocalizedString("booktrix.user.form.email", comment: "Email")
    static let password = NSLocalizedString("booktrix.user.form.password", comment: "Password")
    static let confirmation = NSLocalizedString("booktrix.user.form.confirmation", comment: "Password confirmation")
    static let login = NSLocalizedString("booktrix.user.form.login", comment: "Login")
    static let emailOrLoginFailure = NSLocalizedString("booktrix.sign.up.form.email_or_login_failure", comment: "Email or login already taken")
}
