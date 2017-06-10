//
//  BookshelfViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 04.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class BookshelfViewModel {
    enum UserBooksIndexStatus {
        case success
        case failure(DisplayableError)
    }
    
    typealias UserBooksIndexCompletion = (UserBooksIndexStatus) -> ()
    
    fileprivate(set) var userBooksList: [UserBook] = []
    
    func userBooksIndex(completion: @escaping UserBooksIndexCompletion) {
        let service = UserBookService()
        
        service.userBooksIndex { (result) in
            switch result {
            case .success(let userBooks):
                self.userBooksList = userBooks
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteUserBook(_ userBook: UserBook, completion: @escaping UserBooksIndexCompletion) {
        let service = UserBookService()
        
        service.delete(userBookId: userBook.id) { (result) in
            switch result {
            case .success:
                self.userBooksList = self.userBooksList.filter(){ $0.id != userBook.id }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
