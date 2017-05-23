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
    case matching(String)
    
    var isValid: (String) -> ValidationResult {
        switch self {
        case .nonEmpty:
            return {!$0.isEmpty ? .success : .failure(LocalizedString.empty.validationError)}
        case .atLeast(let count):
            return {$0.characters.count >= count ? .success : .failure(LocalizedString.tooShort.validationError)}
        case .emailFormat:
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return { emailTest.evaluate(with: $0) ? .success : .failure(LocalizedString.notEmail.validationError)}
        case .nameFormat:
            let nameRegEx = ".*[^A-Za-z].*"
            let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
            return { !nameTest.evaluate(with: $0) ? .success : .failure(LocalizedString.notName.validationError)}
        case .matching(let value):
            return { $0 == value ? .success : .failure(LocalizedString.notMatch.validationError) }
        }
    }
}

fileprivate extension LocalizedString {
    static let empty = NSLocalizedString("booktrix.string.validation.empty", comment: "Empty")
    static let tooShort = NSLocalizedString("booktrix.string.validation.too_short", comment: "Too short")
    static let notEmail = NSLocalizedString("booktrix.string.validation.not_email", comment: "Not email")
    static let notName = NSLocalizedString("booktrix.string.validation.not_name", comment: "Not name")
    static let notMatch = NSLocalizedString("booktrix.string.validation.not_matching", comment: "Not match")
}



