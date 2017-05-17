//
//  Validator.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

enum ValidationResult {
    case success
    case failure(Error)
    
    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

protocol Validator {
    associatedtype Subject
    
    var isValid: (Subject) -> ValidationResult { get }
}

extension String: Error { }

protocol Validatable {
    associatedtype ValidatorType: Validator
}

extension Validatable where ValidatorType.Subject == Self {
    func validate(_ validators: ValidatorType...) -> ValidationResult {
        return validators
            .map { $0.isValid(self) }
            .flatMap { $0.error }
            .first
            .map { .failure($0) } ?? .success
    }
}

extension String: Validatable {
    typealias ValidatorType = StringValidation
}

