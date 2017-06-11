//
//  FriendsViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

enum FriendsList: Int {
    case index
    case pending
    case requested
    case blocked
    
    var string: String {
        return String(describing: self)
    }
}

enum FriendsUpdateAction {
    case block
    case accept
    
    var string: String {
        return String(describing: self)
    }
}

enum FriendsDestroyAction {
    case unblock
    case remove
    
    var string: String {
        return String(describing: self)
    }
}

struct FriendsActionForm {
    var login: String
    var action: String
}

final class FriendsViewModel {
    enum FriendsOpStatus {
        case success
        case failure(DisplayableError)
    }
    
    var listKind: FriendsList
    fileprivate(set) var friendsList: [Friend] = []
    
    init() {
        listKind = .index
    }
    
    typealias FriendsOpCompletion = (FriendsOpStatus) -> ()
    
    func friendsIndex(completion: @escaping FriendsOpCompletion) {
        let service = FriendService()
        
        service.index(with: listKind) { (result) in
            switch result {
            case .success(let friends):
                self.friendsList = friends
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func friendUpdate(_ friend: Friend, action: FriendsUpdateAction, completion: @escaping FriendsOpCompletion) {
        let service = FriendService()
        let form = FriendsActionForm(login: friend.login, action: action.string)
        
        service.update(with: form) { (result) in
            switch result {
            case .success(_):
                completion(.success)
            case .failure(.unprocessable):
                let formError = FormError(message: LocalizedString.failure)
                completion(.failure(formError))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func friendDestroy(_ friend: Friend, action: FriendsDestroyAction, completion: @escaping FriendsOpCompletion) {
        let service = FriendService()
        let form = FriendsActionForm(login: friend.login, action: action.string)
        
        service.delete(with: form) { (result) in
            switch result {
            case .success(_):
                completion(.success)
            case .failure(.unprocessable):
                let formError = FormError(message: LocalizedString.failure)
                completion(.failure(formError))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

fileprivate extension LocalizedString {
    static let failure = NSLocalizedString("booktrix.friends.failure", comment: "Problem with finishing request")
}
