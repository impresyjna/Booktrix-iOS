
//
//  UserBook.swift
//  Booktrix
//
//  Created by Impresyjna on 05.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import JSONCodable

struct UserBook {
    let id: Int
    
    let book: Book
    let category: Category?
    let borrower: Friend?
}

extension UserBook: JSONCodable {
    init(object: JSONObject) throws {
        let decoder = JSONDecoder(object: object)
        id = try decoder.decode("id")
        book = try decoder.decode("book")
        category = try decoder.decode("category")
        borrower = try decoder.decode("borrower")
    }
    
    func toJSON() throws -> Any {
        return try JSONEncoder.create { (encoder) in
            try encoder.encode(id, key: "id")
            try encoder.encode(book, key: "book")
            try encoder.encode(category, key: "category")
            try encoder.encode(borrower, key: "borrower")
        }
    }
}
