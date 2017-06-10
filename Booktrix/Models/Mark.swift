
//
//  Mark.swift
//  Booktrix
//
//  Created by Impresyjna on 04.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import JSONCodable

struct Mark {
    let id: Int
    
    let bookId: Int
    let userId: Int
    let value: Int
    let comment: String?
}

extension Mark: JSONCodable {
    init(object: JSONObject) throws {
        let decoder = JSONDecoder(object: object)
        id = try decoder.decode("id")
        bookId = try decoder.decode("book_id")
        userId = try decoder.decode("user_id")
        value = try decoder.decode("value")
        comment = try decoder.decode("comment")
    }
    
    func toJSON() throws -> Any {
        return try JSONEncoder.create { (encoder) in
            try encoder.encode(id, key: "id")
            try encoder.encode(bookId, key: "book_id")
            try encoder.encode(userId, key: "user_id")
            try encoder.encode(value, key: "value")
            try encoder.encode(comment, key: "comment")
        }
    }
}
