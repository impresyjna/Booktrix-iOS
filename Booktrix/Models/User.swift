//
//  User.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import JSONCodable

struct User {
    let id: Int
    
    let login: String
    let email: String
    let name: String
    let surname: String
    let token: String
}

extension User: JSONCodable {
    init(object: JSONObject) throws {
        let decoder = JSONDecoder(object: object)
        id = try decoder.decode("user.id")
        login = try decoder.decode("user.login")
        email = try decoder.decode("user.email")
        name = try decoder.decode("user.name")
        surname = try decoder.decode("user.surname")
        
        token = try decoder.decode("user.auth_token")
    }
    
    func toJSON() throws -> Any {
        return try JSONEncoder.create { (encoder) in
            try encoder.encode(id, key: "user.id")
            try encoder.encode(name, key: "user.name")
            try encoder.encode(surname, key: "user.surname")
            try encoder.encode(email, key: "user.email")
            try encoder.encode(login, key: "user.login")
            try encoder.encode(token, key: "user.auth_token")
        }
    }
}
