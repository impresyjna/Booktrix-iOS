//
//  BookViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 04.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class UserBookForm {
    var title: String
    var author: String
    var description: String?
    var publisher: String?
    var isbn: String?
    var publishDate: String?
    var pageCount: Int?
    var categoryId: Int?
    var image: String?
    
    init() {
        self.title = ""
        self.author = ""
    }
    
    init(_ userBook: UserBook) {
        self.title = userBook.book.title
        self.author = userBook.book.author
        self.description = userBook.book.description
        self.publisher = userBook.book.publisher
        self.isbn = userBook.book.isbn
        self.publishDate = userBook.book.publishDate
        self.pageCount = userBook.book.pageCount
        self.categoryId = userBook.category?.id
        self.image = userBook.book.image
    }
}

enum UserBookAction {
    case add
    case edit(UserBook)
}

final class UserBookViewModel {
    enum AddUpdateStatus {
        case success
        case failure(DisplayableError)
    }
    
    var form: UserBookForm
    var saveAction: UserBookAction
    var userBookId: Int
    
    typealias UserBookCompletion = (AddUpdateStatus) -> ()
    
    init(_ saveAction: UserBookAction) {
        self.saveAction = saveAction
        switch saveAction {
        case .add:
            self.form = UserBookForm()
            self.userBookId = 0
        case .edit(let userBook):
            self.form = UserBookForm(userBook)
            self.userBookId = userBook.id
        }
    }
    
    func fillUserBookForm(book: Book) {
        form.title = book.title
        form.author = book.author
        form.description = book.description
        form.publishDate = book.publisher
        form.publishDate = book.publishDate
        form.isbn = book.isbn
        form.pageCount = book.pageCount
        form.image = book.image
    }
    
    func save(completion: @escaping UserBookCompletion) {
        let status = FieldValidationName(name: LocalizedString.author, validationResult: form.author.validate(.nonEmpty)).result.combine([
            FieldValidationName(name: LocalizedString.title, validationResult: form.title.validate(.nonEmpty)).result
        ])
        
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
    
    private func add(completion: @escaping UserBookCompletion) {
        let service = UserBookService()
        
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
    
    private func edit(completion: @escaping UserBookCompletion) {
        let service = UserBookService()
        
        service.update(with: form, userBookId: userBookId) { (result) in
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
    static let title = NSLocalizedString("booktrix.user_book.form.title", comment: "Title")
    static let author = NSLocalizedString("booktrix.user_book.form.author", comment: "Author")
    static let failure = NSLocalizedString("booktrix.user_book.failure", comment: "Problem with saving")
}
