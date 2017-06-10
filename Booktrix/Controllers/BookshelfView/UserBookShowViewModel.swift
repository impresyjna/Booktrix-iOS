//
//  UserBookShowViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class UserBookShowViewModel {
    enum ShowStatus {
        case success
        case failure(DisplayableError)
    }
    
    fileprivate(set) var userBook: UserBook!
    var userBookId: Int
    
    init(userBookId: Int) {
        self.userBookId = userBookId
    }
    
    typealias UserBookCompletion = (ShowStatus) -> ()
    
    func show(completion: @escaping UserBookCompletion) {
        let service = UserBookService()
        
        service.show(userBookId: userBookId) { (result) in
            switch result {
            case .success(let userBook):
                self.userBook = userBook
                completion(.success)
            case .failure(.notFound):
                let formError = FormError(message: LocalizedString.userBookNotFound)
                completion(.failure(formError))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

fileprivate extension LocalizedString {
    static let userBookNotFound = NSLocalizedString("booktrix.user_book.show.not_found", comment: "User book not found")
}
