//
//  DisplayableError.swift
//  Booktrix
//
//  Created by Impresyjna on 22.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

protocol DisplayableError: Error {
    var errorMessage: String { get }
}

struct FormError: DisplayableError {
    let message: String
    
    var errorMessage: String {
        return message
    }
}
