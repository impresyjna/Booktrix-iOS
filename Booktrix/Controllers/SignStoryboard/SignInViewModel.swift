//
//  SignInViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 14.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//
import UIKit

struct SignInForm {
    var login: String
    var password: String
}

final class SignInViewModel {
    enum SignInStatus {
        case success
        case failure(DisplayableError)
    }
    
    var form: SignInForm
    
    typealias SignInCompletion = (SignInStatus) -> ()
    
    init() {
        form = SignInForm(login: "",  password: "")
    }
    
    func login(completion: @escaping SignInCompletion) {
        let service = UserService()
        
        let status = FieldValidationName(name: LocalizedString.login, validationResult: form.login.validate(.nonEmpty)).result.combine([
            FieldValidationName(name: LocalizedString.password, validationResult: form.password.validate(.nonEmpty, .atLeast(6))).result
        ])
        
        switch status {
        case .success:
            service.login(with: form, completion: { (result) in
                switch result {
                case .success(let user):
                    KeychainStorage().setUser(user)
                    completion(.success)
                case .failure(.unprocessable):
                    let formError = FormError(message: LocalizedString.badAuth)
                    completion(.failure(formError))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        case .failure(let error):
            let formError = FormError(message: error.message)
            completion(.failure(formError))
        }
    }
    
}

fileprivate extension LocalizedString {
    static let password = NSLocalizedString("booktrix.user.form.password", comment: "Password")
    static let login = NSLocalizedString("booktrix.user.form.login", comment: "Login")
    static let badAuth = NSLocalizedString("booktrix.sign.in.form.bad_auth", comment: "Bad auth")
}
