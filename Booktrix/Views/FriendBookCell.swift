//
//  BookCell.swift
//  Booktrix
//
//  Created by Impresyjna on 11.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class FriendBookCell: UITableViewCell, Reusable, NibLoadable  {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setup(book: Book) {
        titleLabel.text = "\(LocalizedString.title): \(book.title)"
        authorLabel.text = "\(LocalizedString.author): \(book.author)"
    }
}

fileprivate extension LocalizedString {
    static let author = NSLocalizedString("booktrix.friend_book.cell.author", comment: "Author")
    static let title = NSLocalizedString("booktrix.friend_book.cell.title", comment: "Title")
}
