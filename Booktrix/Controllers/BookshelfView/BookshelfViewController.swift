//
//  BookshelfViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 04.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class BookshelfViewController: UIViewController {

    let viewModel = BookshelfViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addBook(_ sender: Any) {
        addUserBook()
    }
    
    func bookAction(_ bookAction: UserBookAction) {
        let vc = Wireframe.UserBookView().userBook()
        vc.viewModel = UserBookViewModel(bookAction)
        pushViewFromStoryboard(controller: vc)
    }
    
    func addUserBook() {
        bookAction(.add)
    }
    
    func editUserBok(_ userBook: UserBook) {
        bookAction(.edit(userBook))
    }
}
