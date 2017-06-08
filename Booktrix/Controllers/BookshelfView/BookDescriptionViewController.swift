//
//  BookDescriptionViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 07.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class BookDescriptionViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var descriptionTextView: UITextView!
    
    var viewModel: UserBookDataViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.delegate = self
        self.hideKeyboardWhenTappedAround()
        
        prepareFields()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fillFields()
    }
    
    func prepareFields() {
        descriptionTextView.prepareForView()
    }
    
    func fillFields() {
        descriptionTextView.text = viewModel.form.description
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        viewModel.form.description = descriptionTextView.text
    }

}
