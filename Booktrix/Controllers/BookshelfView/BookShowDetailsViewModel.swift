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
}

final class BookShowDetailsViewModel {
    var details: UserBookDetails
    
    init(_ userBook: UserBook) {
        self.details = UserBookDetails(isbn: userBook.book.isbn, publisher: userBook.book.publisher, publishDate: userBook.book.publishDate, pageCount: userBook.book.pageCount, category: userBook.category?.name)
    }
}
