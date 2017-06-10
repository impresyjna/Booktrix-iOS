//
//  BookShowDetailsViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

struct UserBookDetails {
    var isbn: String?
    var publisher: String?
    var publishDate: String?
    var pageCount: Int?
    var category: String?
    
    init(_ userBook: UserBook) {
        self.isbn = userBook.book.isbn
        self.publisher = userBook.book.publisher
        self.publishDate = userBook.book.publishDate
        self.pageCount = userBook.book.pageCount
        if let category = userBook.category {
            self.category = category.name
        }
    }
}

final class BookShowDetailsViewModel {
    var details: UserBookDetails
    
    init(_ userBook: UserBook) {
        self.details = UserBookDetails(userBook)
    }
}
