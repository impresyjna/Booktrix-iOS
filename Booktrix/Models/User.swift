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
        
        id = try decoder.decode("id")
        login = try decoder.decode("login")
        email = try decoder.decode("email")
        name = try decoder.decode("name")
        surname = try decoder.decode("surname")
        
        token = try decoder.decode("token")
    }
    
    func toJSON() throws -> Any {
        return try JSONEncoder.create { (encoder) in
            try encoder.encode(id, key: "id")
            try encoder.encode(name, key: "name")
            try encoder.encode(surname, key: "surname")
            try encoder.encode(email, key: "email")
            try encoder.encode(login, key: "login")
            try encoder.encode(token, key: "token")
        }
    }
}
