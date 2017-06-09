//
//  UserBookService.swift
//  Booktrix
//
//  Created by Impresyjna on 07.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation

final class UserBookService {
    func userBooksIndex(completion: @escaping (ApiResponse<[UserBook]>) -> ()) {
        let requester = ApiRequester()
        let request = UserBooksIndexRequest()
        
        requester.request(request: request, completion: completion)
    }
    
    func create(with form: UserBookForm, completion: @escaping (ApiResponse<UserBook>) -> ()) {
        let requester = ApiRequester()
        let request = UserBookCreateRequest()
        let params = UserBookParams(form: form)
        
        requester.request(request: request, params: params, completion: completion)
    }
    
    func update(with form: UserBookForm, userBookId: Int, completion: @escaping (ApiResponse<UserBook>) -> ()) {
        let requester = ApiRequester()
        let request = UserBookUpdateRequest(userBookId: userBookId)
        let params = UserBookParams(form: form)
        
        requester.request(request: request, params: params, completion: completion)
    }
}
