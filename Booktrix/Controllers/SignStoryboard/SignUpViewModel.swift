//
//  SignUpViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//


import UIKit

struct SignUpForm {
    var name: String
    var surname: String
    var login: String
    var email: String
    var password: String
    var confirmation: String
}

final class SignUpViewModel {
    var form: SignUpForm
    

    typealias SignUpCompletion = (ApiResponse<User>) -> ()
    
    init() {
        form = SignUpForm(name: "", surname: "", login: "", email: "", password: "", confirmation: "")
    }
    
    func register(completion: SignUpCompletion) {
        let service = UserService()
        
         let status = form.name.validate(.nameFormat).combine([
            form.surname.validate(.nameFormat),
            form.email.validate(.emailFormat, .nonEmpty),
            form.password.validate(.nonEmpty),
            form.confirmation.validate(.matching(form.password), .nonEmpty),
            form.login.validate(.nonEmpty)
        ])
        
        print(status)
    }
    
}
