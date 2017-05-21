//
//  UserService.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation

final class UserService  {
    func register(with form: SignUpForm, completion: @escaping (ApiResponse<User>) -> ()) {
        let requester = ApiRequester()
        let request = RegisterRequest()
        let params = RegisterParams(form: form)
        
        requester.request(request: request, params: params, completion: completion)
    }
    
    func login(with form: SignInForm, completion: @escaping (ApiResponse<User>) -> ()) {
        let requester = ApiRequester()
        let request = LoginRequest()
        let params = LoginParams(form: form)
        
        requester.request(request: request, params: params, completion: completion)
    }
}
