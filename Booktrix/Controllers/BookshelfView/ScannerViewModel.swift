//
//  ScannerViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 07.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

struct ScannerViewModel {
    enum FindingStatus {
        case success
        case failure(DisplayableError)
    }
    
    typealias ScannerCompletion = (FindingStatus) -> ()
    
    let delegate: UserBookProtocol
    
    init(_ delegate: UserBookProtocol) {
        self.delegate = delegate
    }
    
    func findBook(isbn: String, completion: @escaping ScannerCompletion) {
        let service = BookService()
        
        service.findBook(with: isbn) { (result) in
            switch result {
            case .success(let book):
                self.delegate.scanFinished(book: book)
                completion(.success)
            case .failure(.notFound):
                let formError = FormError(message: LocalizedString.bookNotFound)
                completion(.failure(formError))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

fileprivate extension LocalizedString {
    static let bookNotFound = NSLocalizedString("booktrix.scanner.book_not_found", comment: "Book not found")
}
