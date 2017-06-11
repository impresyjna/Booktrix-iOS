//
//  FriendsViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let viewModel = FriendsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.registerNib(for: FriendCell.self)
        tableView.estimatedRowHeight = 95.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switchToTabAtIndex(index: 0)
        fetchFriends()
    }
    
    func fetchFriends() {
        showHud()
        viewModel.friendsIndex { [weak self] result in
            self?.hideHud()
            switch result {
            case .success:
                self?.tableView.reloadData()
            case .failure(let error):
                self?.showError(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = viewModel.friendsList[indexPath.row]
        
        let cell: FriendCell = tableView.dequeue()
        cell.setup(friend: friend)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let block = UITableViewRowAction(style: .normal, title: LocalizedString.block) { action, index in
            self.editFriend(self.viewModel.friendsList[editActionsForRowAt.row], action: .block)
        }
        block.backgroundColor = UIColor(red:0.89, green:0.77, blue:0.40, alpha:1.0)
        
        let remove = UITableViewRowAction(style: .normal, title: LocalizedString.remove) { action, index in
            self.deleteFriend(self.viewModel.friendsList[editActionsForRowAt.row], action: .remove)
        }
        remove.backgroundColor = UIColor(red:0.69, green:0.25, blue:0.24, alpha:1.0)
        
        let accept = UITableViewRowAction(style: .normal, title: LocalizedString.accept) { action, index in
            self.editFriend(self.viewModel.friendsList[editActionsForRowAt.row], action: .accept)
        }
        accept.backgroundColor = UIColor(red:0.20, green:0.40, blue:0.23, alpha:1.0)
        
        let unblock = UITableViewRowAction(style: .normal, title: LocalizedString.unblock) { action, index in
            self.deleteFriend(self.viewModel.friendsList[editActionsForRowAt.row], action: .unblock)
        }
        unblock.backgroundColor = UIColor(red:0.62, green:0.47, blue:0.56, alpha:1.0)
        
        switch viewModel.listKind {
        case .index:
            return [block, remove]
        case .blocked:
            return [unblock, remove]
        case .pending:
            return []
        case .requested:
            return [block, accept]
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func editFriend(_ friend: Friend, action: FriendsUpdateAction) {
        showHud()
        viewModel.friendUpdate(friend, action: action) { [weak self] (result) in
            self?.hideHud()
            switch result {
            case .success:
                self?.fetchFriends()
            case .failure(let error as FormError):
                self?.showError(title: nil, subtitle: error.message, dismissDelay: 3.0)
            case .failure(let error):
                self?.showWarning(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
    }
    
    func deleteFriend(_ friend: Friend, action: FriendsDestroyAction) {
        showHud()
        viewModel.friendDestroy(friend, action: action) { [weak self] (result) in
            self?.hideHud()
            switch result {
            case .success:
                self?.fetchFriends()
            case .failure(let error as FormError):
                self?.showError(title: nil, subtitle: error.message, dismissDelay: 3.0)
            case .failure(let error):
                self?.showWarning(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
    }
    
    @IBAction func addFriendOpen(_ sender: Any) {
        let vc = Wireframe.FriendsView().addFriend()
        pushViewFromStoryboard(controller: vc)
    }
    
    @IBAction func changeTab(_ sender: Any) {
        switchToTabAtIndex(index: segmentedControl.selectedSegmentIndex)
    }
    
    private func switchToTabAtIndex(index: Int) {
        viewModel.listKind = FriendsList(rawValue: index) ?? .index
        segmentedControl.selectedSegmentIndex = viewModel.listKind.rawValue
        fetchFriends()
    }
}

fileprivate extension LocalizedString {
    static let accept = NSLocalizedString("booktrix.friends.view.accept", comment: "Accept")
    static let block = NSLocalizedString("booktrix.friends.view.block", comment: "Block")
    static let unblock = NSLocalizedString("booktrix.friends.view.unblock", comment: "Unblock")
    static let remove = NSLocalizedString("booktrix.friends.view.remove", comment: "Remove")
}
