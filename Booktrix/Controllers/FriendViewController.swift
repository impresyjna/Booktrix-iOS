//
//  FriendViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 11.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class FriendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var booksCountLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FriendViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.registerNib(for: FriendBookCell.self)
        tableView.estimatedRowHeight = 95.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switchToTabAtIndex(index: 0)
        fetchFriend()
    }
    
    func fetchFriend() {
        showHud()
        viewModel.show { [weak self] result in
            self?.hideHud()
            switch result {
            case .success:
                self?.fillFields()
                self?.tableView.reloadData()
            case .failure(let error):
                self?.showError(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
    }
    
    func fillFields() {
        loginLabel.text = viewModel.friend.login
        nameLabel.text = "\(viewModel.friend.name) \(viewModel.friend.surname)"
        booksCountLabel.text = "\(LocalizedString.booksCount): \(viewModel.friend.booksCount)"
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userBook = viewModel.books[indexPath.row]
        
        let cell: FriendBookCell = tableView.dequeue()
        cell.setup(book: userBook.book)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    @IBAction func changeTab(_ sender: Any) {
        switchToTabAtIndex(index: segmentedControl.selectedSegmentIndex)
    }
    
    private func switchToTabAtIndex(index: Int) {
        segmentedControl.selectedSegmentIndex = index
    }
}

fileprivate extension LocalizedString {
    static let booksCount = NSLocalizedString("booktrix.friend.cell.booksCount", comment: "Books in library")
}
