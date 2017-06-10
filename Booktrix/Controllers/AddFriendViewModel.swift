//
//  AddFriendViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

struct AddFriendForm {
    var login: String
}

final class AddFriendViewModel {
    enum AddStatus {
        case success
        case failure(DisplayableError)
    }
    
    var form: AddFriendForm
    
    typealias FriendCompletion = (AddStatus) -> ()
    
    init() {
        form = AddFriendForm(login: "")
    }
    
    func save(completion: @escaping FriendCompletion) {
        let service = FriendService()
        
        let status = FieldValidationName(name: LocalizedString.login, validationResult: form.login.validate(.nonEmpty)).result
        
        switch status {
        case .success:
            service.create(with: form) { (result) in
                switch result {
                case .success(_):
                    completion(.success)
                case .failure(.notFound):
                    let formError = FormError(message: LocalizedString.failure)
                    completion(.failure(formError))
                case .failure(.unprocessable):
                    let formError = FormError(message: LocalizedString.sameLogins)
                    completion(.failure(formError))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        case .failure(let error):
            let formError = FormError(message: error.message)
            completion(.failure(formError))
        }
    }
}

fileprivate extension LocalizedString {
    static let login = NSLocalizedString("booktrix.friend.form.login", comment: "Login")
    static let failure = NSLocalizedString("booktrix.friend.failure", comment: "Not exists")
    static let sameLogins = NSLocalizedString("booktrix.friend.same_logins", comment: "Same logins, can not add friend")
}
