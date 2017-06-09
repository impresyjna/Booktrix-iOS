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
    
//    func deleteCategory(_ category: Category, completion: @escaping CategoriesIndexCompletion) {
//        let service = CategoryService()
//        
//        service.delete(categoryId: category.id) { (result) in
//            switch result {
//            case .success:
//                self.categoriesList = self.categoriesList.filter(){ $0.id != category.id }
//                completion(.success)
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
}
