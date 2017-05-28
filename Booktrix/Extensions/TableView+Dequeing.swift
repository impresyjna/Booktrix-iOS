//
//  TableView+Dequing.swift
//  Booktrix
//
//  Created by Impresyjna on 27.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

extension UITableView {
    func registerClass<Cell: UITableViewCell>(for cellClass: Cell.Type) where Cell: Reusable {
        register(cellClass, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func registerNib<Cell: UITableViewCell>(for: Cell.Type) where Cell: Reusable & NibLoadable {
        register(Cell.nib, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func dequeue<Cell: UITableViewCell>() -> Cell where Cell: Reusable {
        return self.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier) as! Cell
    }
}
