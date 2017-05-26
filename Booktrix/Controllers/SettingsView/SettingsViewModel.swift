//
//  SettingsViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 25.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

struct UserUpdateForm {
    var id: Int
    var name: String
    var surname: String
    var login: String
    var email: String
    var password: String
    var confirmation: String
}

final class SettingsViewModel {
    enum UserUpdateStatus {
        case success
        case failure(DisplayableError)
    }
    
    enum LogoutStatus {
        case success
    }
    
    typealias LogOutCompletion = (LogoutStatus) -> ()
    typealias UserUpdateCompletion = (UserUpdateStatus) -> ()
    
    var form: UserUpdateForm
    
    init() {
        guard let user = KeychainStorage().getUser() else {
            form = UserUpdateForm(id: 0, name: "", surname: "", login: "", email: "", password: "", confirmation: "")
            return
        }
        form = UserUpdateForm(id: user.id, name: user.name,  surname: user.surname, login: user.login, email: user.email, password: "", confirmation: "")
    }
    
    func updateUser(completion: @escaping UserUpdateCompletion) {
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
            service.update(with: form, completion: { (result) in
                switch result {
                case .success(let user):
                    KeychainStorage().setUser(user)
                    completion(.success)
                case .failure(.unprocessable):
                    let formError = FormError(message: LocalizedString.cannotUpdate)
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
    
    func logout(completion: @escaping LogOutCompletion) {
        let service = UserService()
        
        service.logout(completion: { _ in
            completion(.success)
        })
    }
}

fileprivate extension LocalizedString {
    static let name = NSLocalizedString("booktrix.user.form.name", comment: "Name")
    static let surname = NSLocalizedString("booktrix.user.form.surname", comment: "Surname")
    static let email = NSLocalizedString("booktrix.user.form.email", comment: "Email")
    static let password = NSLocalizedString("booktrix.user.form.password", comment: "Password")
    static let confirmation = NSLocalizedString("booktrix.user.form.confirmation", comment: "Password confirmation")
    static let login = NSLocalizedString("booktrix.user.form.login", comment: "Login")
    static let cannotUpdate = NSLocalizedString("booktrix.update.user.cannot_update", comment: "Cannot update. Possible that login or email already taken")
}
