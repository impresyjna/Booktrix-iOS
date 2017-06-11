//
//  FriendCell.swift
//  Booktrix
//
//  Created by Impresyjna on 11.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell, Reusable, NibLoadable {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bookCountsLabel: UILabel!
    
    func setup(friend: Friend) {
        loginLabel.text = friend.login
        nameLabel.text = "\(friend.name) \(friend.surname)"
        bookCountsLabel.text = "\(LocalizedString.booksCount): \(friend.booksCount)"
    }
}

fileprivate extension LocalizedString {
    static let booksCount = NSLocalizedString("booktrix.friend.cell.booksCount", comment: "Books in library")
}
