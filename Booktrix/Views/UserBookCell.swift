//
//  UserBookCell.swift
//  Booktrix
//
//  Created by Impresyjna on 08.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class UserBookCell: UITableViewCell, Reusable, NibLoadable {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    func setup(userBook: UserBook) {
        titleLabel.text = userBook.book.title
        authorLabel.text = userBook.book.author
        publisherLabel.text = "\(LocalizedString.publisher): \(userBook.book.publisher ?? "")"
        isbnLabel.text = "\(LocalizedString.isbnNumber): \(userBook.book.isbn)"
        if let category = userBook.category {
            setBackground(categoryBackground: category.color)
        }
        if let url = URL(string: userBook.book.image ?? "") {
            coverImage.setImage(Image.url(url))
        }
    }
    
    func setBackground(categoryBackground: String?) {
        if let color = categoryBackground {
            nextButton.backgroundColor = UIColor(UInt32(color) ?? 0)
        }
    }
    
}

fileprivate extension LocalizedString {
    static let publisher = NSLocalizedString("booktrix.user_book.cell.publisher", comment: "Publisher")
    static let isbnNumber = NSLocalizedString("booktrix.user_book.cell.isbn_number", comment: "ISBN number")
}
