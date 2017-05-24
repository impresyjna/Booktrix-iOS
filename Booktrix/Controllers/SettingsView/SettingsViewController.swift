//
//  SettingsViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 25.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameAndSurnameLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveSettingsAction(_ sender: Any) {
        print("Save")
    }

    @IBAction func logoutAction(_ sender: Any) {
        print("Logout")
    }

    @IBAction func bookCategoriesAction(_ sender: Any) {
        print("Book categories")
    }
}
