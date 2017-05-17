//
//  SignUpViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//


import UIKit

struct SignUpForm {
    var name: String?
    var surname: String?
    var login: String?
    var email: String?
    var password: String?
    var confirmation: String?
}

protocol SignUpViewModelProtocol {
    
    weak var delegate: SignUpViewControllerDelegate? { get set }
    
    //var submitTextColor: UIColor { get }
   // var submitEnabled: Bool { get }
}

protocol SignUpViewControllerDelegate: class {
    func reloadViews()
    func goToActivityPage()
}

struct SignUpViewModel: SignUpViewModelProtocol {
    weak var delegate: SignUpViewControllerDelegate?

    internal var submitEnabled : Bool = true

//    var submitEnabled: Bool {
//        return usernameValid //&& passwordValid
//    }
    
    // MARK: - Actions
    
    func submitButtonPressed() {
        
    }
    
    
    // MARK: - Delegate Response
    
    private func delegateSignUpAction() {
        delegate?.goToActivityPage()
    }
    
    private func delegateReloadViews() {
        delegate?.reloadViews()
    }
    
}
