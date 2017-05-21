//
//  NamedObjectValidation.swift
//  Booktrix
//
//  Created by Impresyjna on 18.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation

struct FieldValidationName {
    var name: String
    var validationResult: ValidationResult
    
    init(name: String, validationResult: ValidationResult) {
        self.name = name
        self.validationResult = validationResult
    }
    
    var result: ValidationResult {
        get {
            switch validationResult {
            case .success:
                return .success
            case .failure(let error):
                return .failure(ValidationError(message: "\(name) \(LocalizedString.invalid): \(error.message)"))
            }
        }
    }
}

fileprivate extension LocalizedString {
    static let invalid = NSLocalizedString("booktrix.named.object.validation.invalid", comment: "Invalid")
}
