//
//  Book.swift
//  Booktrix
//
//  Created by Impresyjna on 04.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import JSONCodable

struct Book {
    let id: Int
    let title: String
    let author: String
    let publisher: String?
    let isbn: String
    let publisherCity: String?
    let image: String?
    let description: String?
    let publishDate: String?
    let pageCount: Int?
    let marks: [Mark]
}

extension Book: JSONCodable {
    init(object: JSONObject) throws {
        let decoder = JSONDecoder(object: object)
        id = try decoder.decode("id")
        title = try decoder.decode("title")
        author = try decoder.decode("author")
        publisher = try decoder.decode("publisher")
        isbn = try decoder.decode("isbn")
        publisherCity = try decoder.decode("publisher_city")
        image = try decoder.decode("image")
        description = try decoder.decode("description")
        publishDate = try decoder.decode("publish_date")
        pageCount = try decoder.decode("page_count")
        marks = try decoder.decode("marks")
    }
    
    func toJSON() throws -> Any {
        return try JSONEncoder.create { (encoder) in
            try encoder.encode(id, key: "id")
            try encoder.encode(title, key: "title")
            try encoder.encode(author, key: "author")
            try encoder.encode(publisher, key: "publisher")
            try encoder.encode(isbn, key: "isbn")
            try encoder.encode(publisherCity, key: "publisher_city")
            try encoder.encode(image, key: "image")
            try encoder.encode(description, key: "description")
            try encoder.encode(publishDate, key: "publish_date")
            try encoder.encode(pageCount, key: "page_count")
            try encoder.encode(marks, key: "marks")
        }
    }
}
