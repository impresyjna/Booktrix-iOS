//
//  CategoryViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 30.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit
import IGColorPicker

final class CategoryViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var colorPickerView: UIView!
    @IBOutlet weak var colorPick: ColorPickerView!
    @IBOutlet weak var categoryButton: UIButton!
    
    var viewModel: CategoryViewModel = CategoryViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: LocalizedString.save, style: .plain, target: self, action: #selector(save))
        
        prepareFields()
        
        colorPick.delegate = self
        
        var colors: [UIColor] = []
        
        for color in CategoryBackground.allValues {
            colors.append(UIColor(color))
        }
        
        colorPick.colors = colors
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

    @IBAction func showColorPicker(_ sender: Any) {
        colorPickerView.isHidden = false
    }
}

// MARK: - ColorPickerViewDelegate
extension CategoryViewController: ColorPickerViewDelegate {
    
    func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath) {
        self.colorPickerView.isHidden = true
        viewModel.form.color = CategoryBackground.allValues[indexPath.row].rawValue.description
        categoryButton.backgroundColor = UIColor(UInt32(viewModel.form.color!)!)
    }
    
    // This is an optional method
    func colorPickerView(_ colorPickerView: ColorPickerView, didDeselectItemAt indexPath: IndexPath) {
        // A color has been deselected
    }
    
}
