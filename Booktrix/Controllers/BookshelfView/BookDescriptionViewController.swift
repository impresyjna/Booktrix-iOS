//
//  BookDescriptionViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 07.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class BookDescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareFields()
    }
    
    func prepareFields() {
        descriptionTextView.prepareForView()
    }

}
