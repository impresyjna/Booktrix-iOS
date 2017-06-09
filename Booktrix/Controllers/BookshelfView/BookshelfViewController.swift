//
//  BookshelfViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 04.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class BookshelfViewController: UITableViewController {

    let viewModel = BookshelfViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(for: UserBookCell.self)
        tableView.estimatedRowHeight = 110.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchUserBooks()
    }
    
    func fetchUserBooks() {
        showHud()
        viewModel.userBooksIndex { [weak self] result in
            switch result {
            case .success:
                self?.tableView.reloadData()
                self?.hideHud()
            case .failure(let error):
                self?.showError(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
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
    
    func editUserBook(_ userBook: UserBook) {
        bookAction(.edit(userBook))
    }
    
    func deleteUserBook(_ userBook: UserBook) {
        showHud()
//        viewModel.deleteCategory(category) { [weak self] result in
//            switch result {
//            case .success:
//                self?.tableView.reloadData()
//                self?.hideHud()
//            case .failure(let error):
//                self?.showError(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
//            }
//        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userBooksList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userBook = viewModel.userBooksList[indexPath.row]
        
        let cell: UserBookCell = tableView.dequeue()
        cell.setup(userBook: userBook)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .normal, title: LocalizedString.edit) { action, index in
            self.editUserBook(self.viewModel.userBooksList[editActionsForRowAt.row])
        }
        edit.backgroundColor = UIColor(red:0.30, green:0.53, blue:0.66, alpha:1.0)
        
        let delete = UITableViewRowAction(style: .normal, title: LocalizedString.delete) { action, index in
            self.deleteUserBook(self.viewModel.userBooksList[editActionsForRowAt.row])
        }
        delete.backgroundColor = UIColor(red:0.69, green:0.25, blue:0.24, alpha:1.0)
        
        return [edit, delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}

