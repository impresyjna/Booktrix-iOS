//
//  CategoryService.swift
//  Booktrix
//
//  Created by Impresyjna on 28.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class CategoryService {
    func categoriesIndex(completion: @escaping (ApiResponse<[Category]>) -> ()) {
        let requester = ApiRequester()
        let request = CategoriesIndexRequest()
        
        requester.request(request: request, completion: completion)
    }
    
    func delete(categoryId: Int, completion: @escaping (ApiResponse<Void>) -> ()) {
        let requester = ApiRequester()
        let request = CategoryDestoryRequest(categoryId: categoryId)
        
        requester.request(request: request, completion: completion)
    }
    
}
