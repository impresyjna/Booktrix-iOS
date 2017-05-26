//
//  SettingsViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 25.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameAndSurnameLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    let viewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        prepareFields()
    }
    
    func prepareFields() {
        guard let user = KeychainStorage().getUser() else {
            return
        }
        loginLabel.text = user.login
        nameAndSurnameLabel.text = "\(user.name) \(user.surname)"
        loginTextField.text = user.login
        emailTextField.text = user.email
        nameTextField.text = user.name
        surnameTextField.text = user.surname
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        viewModel.form.login = loginTextField.text ?? ""
        viewModel.form.password = passwordTextField.text ?? ""
        viewModel.form.confirmation = confirmationTextField.text ?? ""
        viewModel.form.name = nameTextField.text ?? ""
        viewModel.form.surname = surnameTextField.text ?? ""
        viewModel.form.email = emailTextField.text ?? ""
    }
    
    @IBAction func saveSettingsAction(_ sender: Any) {
        self.showHud()
        viewModel.updateUser { [weak self] (result) in
            self?.hideHud()
            switch result {
            case .success:
                self?.showSuccess(title: LocalizedString.updateSuccess, subtitle: nil, dismissDelay: 3.0)
            case .failure(let error as FormError):
                self?.showError(title: LocalizedString.updateFailure, subtitle: error.message, dismissDelay: 3.0)
            case .failure(let error):
                self?.showWarning(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        showHud()
        viewModel.logout(completion: { _ in })
        KeychainStorage().deleteUser()
        setNewRoot(controller: Wireframe.SignInView().signIn())
    }
    
    @IBAction func bookCategoriesAction(_ sender: Any) {
        pushViewFromStoryboard(controller: Wireframe.CategoriesView().categories())
    }
    
    @IBAction func navigateThroughInputs(_ sender: UITextField) {
        let nextTag = sender.tag + 1;
        jump(toNextTextField: sender, withTag: nextTag)
    }
}

fileprivate extension LocalizedString {
    static let updateSuccess = NSLocalizedString("booktrix.update.save.success", comment: "Success update")
    static let updateFailure = NSLocalizedString("booktrix.update.save.failure", comment: "Update failure")
}
