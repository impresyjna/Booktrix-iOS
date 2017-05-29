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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(category: Category) {
        titleLabel.text = category.name
        booksCountLabel.text = "\(LocalizedString.booksCount): \(category.booksCount)"
    }

}

fileprivate extension LocalizedString {
    static let booksCount = NSLocalizedString("booktrix.category.cell.booksCount", comment: "Books in category")
}
