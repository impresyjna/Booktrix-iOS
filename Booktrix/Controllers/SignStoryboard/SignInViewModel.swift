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
    var form: SignInForm
    
    
    typealias SignInCompletion = (ApiResponse<User>) -> ()
    
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
                    completion(.success(user))
                case .failure(let error as HTTPError):
                    completion(.failure(HTTPError(code: error.code, message: LocalizedString.badAuth)))
                default:
                    completion(.failure(HTTPError(code: 500, message: LocalizedString.serverError)))
                }
            })
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
}

fileprivate extension LocalizedString {
    static let password = NSLocalizedString("booktrix.user.form.password", comment: "Password")
    static let login = NSLocalizedString("booktrix.user.form.login", comment: "Login")
    static let badAuth = NSLocalizedString("booktrix.sign.in.form.bad_auth", comment: "Bad auth")
}
