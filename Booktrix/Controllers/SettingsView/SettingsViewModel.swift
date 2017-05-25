//
//  SettingsViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 25.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class SettingsViewModel {
    enum SettingsSaveStatus {
        case success
        case failure(DisplayableError)
    }
    
    enum LogoutStatus {
        case success
    }
    
    typealias LogOutCompletion = (LogoutStatus) -> ()
    
    func logout(completion: @escaping LogOutCompletion) {
        let service = UserService()
        
        service.logout(completion: { _ in
            completion(.success)
        })
    }
}
