//
//  FriendService.swift
//  Booktrix
//
//  Created by Impresyjna on 11.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation

final class FriendService {
    func create(with form: AddFriendForm, completion: @escaping (ApiResponse<[Friend]>) -> ()) {
        let requester = ApiRequester()
        let request = FriendCreateRequest()
        let params = FriendParams(form: form)
        
        requester.request(request: request, params: params, completion: completion)
    }
}
