//
//  FriendService.swift
//  Booktrix
//
//  Created by Impresyjna on 11.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation
import Alamofire

final class FriendService {
    func create(with form: AddFriendForm, completion: @escaping (ApiResponse<[Friend]>) -> ()) {
        let requester = ApiRequester()
        let request = FriendCreateRequest()
        let params = FriendParams(form: form)
        
        requester.request(request: request, params: params, completion: completion)
    }
    
    func index(with friendsList: FriendsList, completion: @escaping (ApiResponse<[Friend]>) -> ()) {
        let requester = ApiRequester()
        let request = FriendsIndexRequest()
        let params = FriendsIndexParams(friendsList: friendsList)
        
        requester.request(request: request, params: params, encoding: URLEncoding(), completion: completion)
    }
    
    func delete(with form:FriendsActionForm, completion: @escaping (ApiResponse<Void>) -> ()) {
        let requester = ApiRequester()
        let request = FriendDestoryRequest()
        let params = FriendActionParams(form: form)
        
        requester.request(request: request, params: params, completion: completion)
    }
    
    func update(with form:FriendsActionForm, completion: @escaping (ApiResponse<Void>) -> ()) {
        let requester = ApiRequester()
        let request = FriendUpdateRequest()
        let params = FriendActionParams(form: form)
        
        requester.request(request: request, params: params, completion: completion)
    }
}
