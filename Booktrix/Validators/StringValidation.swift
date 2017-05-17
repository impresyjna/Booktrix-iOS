//
//  SignUpInputValidator.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

enum StringValidation: Validator {
    case nonEmpty
    case atLeast(Int)
    case emailFormat
    case nameFormat
    
    var isValid: (String) -> ValidationResult {
        switch self {
        case .nonEmpty:
            return {!$0.isEmpty ? .success : .failure("Empty")}
        case .atLeast(let count):
            return {$0.characters.count >= count ? .success : .failure("Too short")}
        case .emailFormat:
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return { emailTest.evaluate(with: $0) ? .success : .failure("Not email")}
        case .nameFormat:
            let nameRegEx = ".*[^A-Za-z].*"
            let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
            return { !nameTest.evaluate(with: $0) ? .success : .failure("Not name")}
        }
    }
}



