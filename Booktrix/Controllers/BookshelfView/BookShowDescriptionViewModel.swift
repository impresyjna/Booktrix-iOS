//
//  BookShowDescriptionViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

struct BookDescription {
    var description: String?
}

final class BookShowDescriptionViewModel {
    var description: BookDescription
    
    init(_ userBook: UserBook) {
        self.description = BookDescription(description: userBook.book.description)
    }
}
