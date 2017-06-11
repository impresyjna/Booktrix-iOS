//
//  Friend.swift
//  Booktrix
//
//  Created by Impresyjna on 05.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import JSONCodable

struct Friend {
    let id: Int
    let name: String
    let surname: String
    let email: String
    let login: String
    let booksCount: Int
}

extension Friend: JSONCodable {
    init(object: JSONObject) throws {
        let decoder = JSONDecoder(object: object)
        id = try decoder.decode("id")
        login = try decoder.decode("login")
        email = try decoder.decode("email")
        name = try decoder.decode("name")
        surname = try decoder.decode("surname")
        booksCount = try decoder.decode("books_count")
    }
    
    func toJSON() throws -> Any {
        return try JSONEncoder.create { (encoder) in
            try encoder.encode(id, key: "id")
            try encoder.encode(name, key: "name")
            try encoder.encode(surname, key: "surname")
            try encoder.encode(email, key: "email")
            try encoder.encode(login, key: "login")
            try encoder.encode(booksCount, key: "books_count")
        }
    }
}
