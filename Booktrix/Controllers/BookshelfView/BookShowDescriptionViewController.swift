//
//  BookShowDescriptionViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class BookShowDescriptionViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextView: UITextView!

    var viewModel: BookShowDescriptionViewModel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fillFields()
    }

    func fillFields() {
        descriptionTextView.text = viewModel.description.description
    }
}
