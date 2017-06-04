//
//  CategoryCell.swift
//  Booktrix
//
//  Created by Impresyjna on 27.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class CategoryCell: UITableViewCell, Reusable, NibLoadable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var booksCountLabel: UILabel!
    
    func setup(category: Category) {
        titleLabel.text = category.name
        booksCountLabel.text = "\(LocalizedString.booksCount): \(category.booksCount)"
        setBackground(categoryBackground: category.color)
    }
    
    func setBackground(categoryBackground: String?) {
        if let color = categoryBackground {
            self.backgroundColor = UIColor(UInt32(color) ?? 0)
        }
    }

}

fileprivate extension LocalizedString {
    static let booksCount = NSLocalizedString("booktrix.category.cell.booksCount", comment: "Books in category")
}
