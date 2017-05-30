//
//  RequestParams.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation

protocol RequestParams {
    var params: [String: Any] { get }
}

struct RegisterParams: RequestParams {
    let form: SignUpForm
    
    var params: [String: Any] {
        return [
            "user" : [
                "name" : form.name,
                "surname" : form.surname,
                "login" : form.login,
                "email" : form.email,
                "password" : form.password,
                "password_confirmation" : form.confirmation
            ],
            "user_setting": [
                    "show_full_name":  true,
                    "show_gifts_boolean": true,
                    "show_activities": true,
                    "show_books": true
            ]
        ]
    }
}

struct LoginParams: RequestParams {
    let form: SignInForm
    
    var params: [String: Any] {
        return [
            "session" : [
                "login" : form.login,
                "password" : form.password
            ]
        ]
    }
}

struct UserUpdateParams: RequestParams {
    let form: UserUpdateForm
    
    var params: [String: Any] {
        return [
            "user" : [
                "name" : form.name,
                "surname" : form.surname,
                "login" : form.login,
                "email" : form.email,
                "password" : form.password,
                "password_confirmation" : form.confirmation
            ],
            "user_setting": [
                "show_full_name":  true,
                "show_gifts_boolean": true,
                "show_activities": true,
                "show_books": true
            ]
        ]
    }
}

struct CategoryCreateParams: RequestParams {
    let form: CategoryForm
    
    var params: [String: Any] {
        return [
            "category" : [
                "name" : form.name,
                "password" : form.password
            ]
        ]
    }
}
