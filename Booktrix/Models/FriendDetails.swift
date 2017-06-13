//
//  FriendDetails.swift
//  Booktrix
//
//  Created by Impresyjna on 11.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import JSONCodable

struct FriendDetails {
    let friendId: Int
    let name: String
    let surname: String
    let login: String
    let booksCount: Int
    let books: [UserBook]
    let gifts: [Gift]
}

extension FriendDetails: JSONCodable {
    init(object: JSONObject) throws {
        let decoder = JSONDecoder(object: object)
        friendId = try decoder.decode("id")
        name = try decoder.decode("name")
        surname = try decoder.decode("surname")
        login = try decoder.decode("login")
        booksCount = try decoder.decode("books_count")
        books = try decoder.decode("books")
        gifts = try decoder.decode("gifts")
    }
    
    func toJSON() throws -> Any {
        return try JSONEncoder.create { (encoder) in
            try encoder.encode(friendId, key: "id")
            try encoder.encode(name, key: "name")
            try encoder.encode(surname, key: "surname")
            try encoder.encode(login, key: "login")
            try encoder.encode(booksCount, key: "booksCount")
            try encoder.encode(books, key: "books")
            try encoder.encode(gifts, key: "gifts")
        }
    }
}
