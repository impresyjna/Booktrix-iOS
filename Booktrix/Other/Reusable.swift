//
//  Reusable.swift
//  Booktrix
//
//  Created by Impresyjna on 27.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
