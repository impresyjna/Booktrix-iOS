//
//  Category.swift
//  Booktrix
//
//  Created by Impresyjna on 27.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import JSONCodable

struct Category {
    let id: Int
    
    let name: String
    let color: String?
    let fontColor: String?
    let booksCount: Int
}

extension Category: JSONCodable {
    init(object: JSONObject) throws {
        let decoder = JSONDecoder(object: object)
        id = try decoder.decode("id")
        name = try decoder.decode("name")
        color = try decoder.decode("color")
        fontColor = try decoder.decode("font_color")
        booksCount = try decoder.decode("user_books_count")
    }
    
    func toJSON() throws -> Any {
        return try JSONEncoder.create { (encoder) in
            try encoder.encode(id, key: "id")
            try encoder.encode(name, key: "name")
            try encoder.encode(color, key: "color")
            try encoder.encode(fontColor, key: "font_color")
            try encoder.encode(booksCount, key: "user_books_count")
        }
    }
}
