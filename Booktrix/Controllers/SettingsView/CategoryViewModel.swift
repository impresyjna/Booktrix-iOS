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
    case edit(Category)
}

final class CategoryViewModel {
    enum AddUpdateStatus {
        case success
        case failure(DisplayableError)
    }
    
    var form: CategoryForm
    var saveAction: CategoryAction
    var categoryId: Int
    
    typealias CategoryCompletion = (AddUpdateStatus) -> ()
    
    init(_ saveAction: CategoryAction) {
        switch saveAction {
        case .add:
            form = CategoryForm(name: "", color: nil, fontColor: nil)
            self.saveAction = saveAction
            self.categoryId = 0
        case .edit(let category):
            form = CategoryForm(name: category.name, color: category.color, fontColor: category.fontColor)
            self.saveAction = saveAction
            self.categoryId = category.id
        }
        
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
    
    private func add(completion: @escaping CategoryCompletion) {
        let service = CategoryService()
        
        service.create(with: form) { (result) in
            switch result {
            case .success(_):
                completion(.success)
            case .failure(.unprocessable):
                let formError = FormError(message: LocalizedString.failure)
                completion(.failure(formError))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func edit(completion: @escaping CategoryCompletion) {
        let service = CategoryService()
        
        service.update(with: form, categoryId: categoryId) { (result) in
            switch result {
            case .success(_):
                completion(.success)
            case .failure(.unprocessable):
                let formError = FormError(message: LocalizedString.failure)
                completion(.failure(formError))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

fileprivate extension LocalizedString {
    static let name = NSLocalizedString("booktrix.category.form.name", comment: "Name")
    static let failure = NSLocalizedString("booktrix.category.failure", comment: "Error")
}
