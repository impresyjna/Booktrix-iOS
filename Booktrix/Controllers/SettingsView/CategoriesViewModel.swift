//
//  CategoriesViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 28.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class CategoriesViewModel: NSObject {
    enum CategoriesIndexStatus {
        case success
        case failure(DisplayableError)
    }
    
    typealias CategoriesIndexCompletion = (CategoriesIndexStatus) -> ()
    
    var categoriesList: [Category] = []
    
    func categoriesIndex(completion: @escaping CategoriesIndexCompletion) {
        let service = CategoryService()
        
        service.categoriesIndex(completion: { (result) in
            switch result {
            case .success(let categories):
                self.categoriesList = categories
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
