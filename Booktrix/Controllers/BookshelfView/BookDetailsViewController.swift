//
//  BookDetailsViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 07.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController {

    @IBOutlet weak var isbnTextField: UITextField!
    @IBOutlet weak var publisherTextField: UITextField!
    @IBOutlet weak var publishDateTextField: UITextField!
    @IBOutlet weak var pageCountTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField! //TODO: Make this to choose from server
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareFields()
    }
    
    func prepareFields() {
        isbnTextField.innerViewsLook()
        publisherTextField.innerViewsLook()
        publishDateTextField.innerViewsLook()
        pageCountTextField.innerViewsLook()
        categoryTextField.innerViewsLook()
    }

}
