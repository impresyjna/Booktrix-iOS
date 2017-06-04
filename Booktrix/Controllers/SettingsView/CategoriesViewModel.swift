//
//  CategoriesViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 28.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class CategoriesViewModel {
    enum CategoriesIndexStatus {
        case success
        case failure(DisplayableError)
    }
    
    typealias CategoriesIndexCompletion = (CategoriesIndexStatus) -> ()
    
    fileprivate(set) var categoriesList: [Category] = []
    
    func categoriesIndex(completion: @escaping CategoriesIndexCompletion) {
        let service = CategoryService()
        
        service.categoriesIndex { (result) in
            switch result {
            case .success(let categories):
                self.categoriesList = categories
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteCategory(_ category: Category, completion: @escaping CategoriesIndexCompletion) {
        let service = CategoryService()
        
        service.delete(categoryId: category.id) { (result) in
            switch result {
            case .success:
                self.categoriesList = self.categoriesList.filter(){ $0.id != category.id }
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
