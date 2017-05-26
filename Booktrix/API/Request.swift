//
//  Request.swift
//  Booktrix
//
//  Created by Impresyjna on 16.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Alamofire

protocol Request {
    var baseURL: URL { get }
    var path: String { get }
    
    var method: Alamofire.HTTPMethod { get }
}

extension Request {
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var baseURL: URL {
        let url: URL
        #if DEBUG
            url = URL(string: "http://localhost:3000/api/")!
        #else
            url = URL(string: "https://booktrix-server.herokuapp.com/api/")!
        #endif
        return url
    }
    
    var url: URL {
        return URL(string: path, relativeTo: baseURL)!
    }
    
}

struct RegisterRequest: Request {
    var method: HTTPMethod {
        return .post
    }
    
    var path: String {
        return "users"
    }
}

struct LoginRequest: Request {
    var method: HTTPMethod {
        return .post
    }
    
    var path: String {
        return "sessions"
    }
}

struct LogoutRequest: Request {
    var method: HTTPMethod {
        return .delete
    }
    
    var path: String {
        return "sessions"
    }
}

struct UserUpdateRequest: Request {
    let userId: Int
    
    var method: HTTPMethod {
        return .patch
    }
    
    var path: String {
        return "users/\(userId)"
    }
}
