//
//  BookService.swift
//  Booktrix
//
//  Created by Impresyjna on 08.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation
import Alamofire

final class BookService {
    func findBook(with isbn: String, completion: @escaping (ApiResponse<Book>) -> ()) {
        let requester = ApiRequester()
        let request = FindBook()
        let params = FindBookParams(isbn: isbn)
        
        requester.request(request: request, params: params, encoding: URLEncoding(), completion: completion)
    }
    
}
