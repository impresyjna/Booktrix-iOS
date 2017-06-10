//
//  BookDetailsViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 07.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class BookDetailsViewController: UIViewController {

    @IBOutlet weak var isbnTextField: UITextField!
    @IBOutlet weak var publisherTextField: UITextField!
    @IBOutlet weak var publishDateTextField: UITextField!
    @IBOutlet weak var pageCountTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField! //TODO: Make this to choose from server
    
    var viewModel: UserBookDataViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        prepareFields()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fillFields()
    }
    
    func prepareFields() {
        isbnTextField.innerViewsLook()
        publisherTextField.innerViewsLook()
        publishDateTextField.innerViewsLook()
        pageCountTextField.innerViewsLook()
        categoryTextField.innerViewsLook()
    }
    
    func fillFields() {
        isbnTextField.text = viewModel.form.isbn
        publisherTextField.text = viewModel.form.publisher
        publishDateTextField.text = viewModel.form.publishDate
        if let pageCount = viewModel.form.pageCount {
            pageCountTextField.text = "\(pageCount)"
        }
        if let categoryId = viewModel.form.categoryId {
            categoryTextField.text = "\(categoryId)"
        }
    }
    
    @IBAction func navigateThroughInputs(_ sender: UITextField) {
        let nextTag = sender.tag + 1;
        jump(toNextTextField: sender, withTag: nextTag)
    }

    @IBAction func textFieldChanged(_ sender: Any) {
        viewModel.form.isbn = isbnTextField.text ?? ""
        viewModel.form.publisher = publisherTextField.text ?? ""
        viewModel.form.publishDate = publishDateTextField.text ?? ""
        viewModel.form.pageCount = Int(pageCountTextField.text ?? "")
        viewModel.form.categoryId = Int(categoryTextField.text ?? "")
    }
}
