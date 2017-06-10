//
//  BookShowDetailsViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class BookShowDetailsViewController: UIViewController {
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var pageCountLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var viewModel: BookShowDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fillFields()
    }
    
    func fillFields() {
        isbnLabel.text = viewModel.details.isbn
        publisherLabel.text = viewModel.details.publisher
        publishDateLabel.text = viewModel.details.publishDate
        if let pageCount = viewModel.details.pageCount {
            pageCountLabel.text = String(describing: pageCount)
        }
        categoryLabel.text = viewModel.details.category
    }
}
