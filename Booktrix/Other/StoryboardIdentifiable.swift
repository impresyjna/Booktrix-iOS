//
//  StoryboardIdentifiable.swift
//  Booktrix
//
//  Created by Impresyjna on 21.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    static var identifier: String { get }
}

extension StoryboardIdentifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController : StoryboardIdentifiable {}
