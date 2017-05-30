//
//  CategoryViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 30.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    var viewModel: CategoryViewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: LocalizedString.save, style: .plain, target: self, action: #selector(save))
        
        prepareFields()
    }
    
    func prepareFields() {
        nameTextField.text = viewModel.form.name
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
       viewModel.form.name = nameTextField.text ?? ""
    }
    
    func save() {
        self.showHud()
        viewModel.save { [weak self] (result) in
            self?.hideHud()
            switch result {
            case .success:
                self?.dismissView()
            case .failure(let error as FormError):
                self?.showError(title: nil, subtitle: error.message, dismissDelay: 3.0)
            case .failure(let error):
                self?.showWarning(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
    }

}
