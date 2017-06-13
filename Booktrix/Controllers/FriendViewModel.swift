//
//  FriendViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 11.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class FriendViewModel {
    enum ShowStatus {
        case success
        case failure(DisplayableError)
    }
    
    fileprivate(set) var friend: FriendDetails!
    fileprivate(set) var books: [UserBook] = []
    var friendId: Int
    
    init(friendId: Int) {
        self.friendId = friendId
    }
    
    typealias FriendCompletion = (ShowStatus) -> ()
    
    func show(completion: @escaping FriendCompletion) {
        let service = FriendService()
        
        service.show(friendId: friendId) { (result) in
            switch result {
            case .success(let friend):
                self.friend = friend
                self.books = friend.books
                completion(.success)
            case .failure(.notFound):
                let formError = FormError(message: LocalizedString.friendNotFound)
                completion(.failure(formError))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

fileprivate extension LocalizedString {
    static let friendNotFound = NSLocalizedString("booktrix.friend.show.not_found", comment: "Friend not found")
}
