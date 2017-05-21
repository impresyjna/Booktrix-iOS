//
//  Validator.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation

struct ValidationError: LocalizedError {
    let message: String
    
    var localizedDescription: String {
        return message
    }
}

enum ValidationResult {
    case success
    case failure(ValidationError)
    
    var error: ValidationError? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
    
    func combine(_ result: ValidationResult) -> ValidationResult {
        switch (self, result) {
        case (.success, .success):
            return .success
        case (.failure(let error), .success), (.success, .failure(let error)):
            return .failure(error)
        case (.failure(let firstError), .failure(let secondError)):
            let error = ValidationError(message: "\(firstError.message)\n\(secondError.message)")
            return .failure(error)
        }
    }
    
    func combine(_ results: [ValidationResult]) -> ValidationResult {
        return results.reduce(self) { $0.combine($1) }
    }
}

protocol Validator {
    associatedtype Subject
    
    var isValid: (Subject) -> ValidationResult { get }
}

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
    
    var validationError: ValidationError {
        return ValidationError(message: self)
    }
}


