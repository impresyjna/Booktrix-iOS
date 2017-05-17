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
                "name" : form.name ?? "",
                "surname" : form.surname ?? "",
                "login" : form.login ?? "",
                "email" : form.email ?? "",
                "password" : form.password ?? "",
                "password_confirmation" : form.confirmation ?? ""
            ]
        ]
    }
}
