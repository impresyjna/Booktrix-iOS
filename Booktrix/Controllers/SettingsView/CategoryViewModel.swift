//
//  CategoryViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 30.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

struct CategoryForm {
    var name: String
    var color: String?
    var fontColor: String?
}

enum CategoryAction {
    case add
    case edit
}

final class CategoryViewModel {
    enum AddUpdateStatus {
        case success
        case failure(DisplayableError)
    }
    
    var form: CategoryForm
    var saveAction: CategoryAction
    
    typealias CategoryCompletion = (AddUpdateStatus) -> ()
    
    init(_ saveAction: CategoryAction = .add) {
        form = CategoryForm(name: "", color: nil, fontColor: nil)
        self.saveAction = saveAction
    }
    
    init(category: Category, saveAction: CategoryAction = .edit) {
        form = CategoryForm(name: category.name, color: category.color, fontColor: category.fontColor)
        self.saveAction = saveAction
    }
    
    func save(completion: @escaping CategoryCompletion) {
        let status = FieldValidationName(name: LocalizedString.name, validationResult: form.name.validate(.nonEmpty)).result
        
        switch status {
        case .success:
            switch saveAction {
            case .add:
                add(completion: { result in
                    completion(result)
                })
            case .edit:
                edit(completion: { result in
                    completion(result)
                })
            }
        case .failure(let error):
            let formError = FormError(message: error.message)
            completion(.failure(formError))
        }
    }
    
    func add(completion: CategoryCompletion) {
        let service = CategoryService()
        
    }
    
    func edit(completion: CategoryCompletion) {
        let service = CategoryService()
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
