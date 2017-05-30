//
//  CategoriesTableViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 26.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class CategoriesTableViewController: UITableViewController {
    let viewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizedString.title
        navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCategory))
        
        tableView.registerNib(for: CategoryCell.self)
        tableView.estimatedRowHeight = 85.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchCategories()
    }
    
    func fetchCategories() {
        showHud()
        viewModel.categoriesIndex(completion: { [weak self] result in
            switch result {
            case .success:
                self?.tableView.reloadData()
                self?.hideHud()
            case .failure(let error):
                self?.showError(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        })
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categoriesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = viewModel.categoriesList[indexPath.row]
        
        let cell: CategoryCell = tableView.dequeue()
        cell.setup(category: category)
        
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
            print("more button tapped")
        }
        edit.backgroundColor = UIColor(red:0.30, green:0.53, blue:0.66, alpha:1.0)
        
        let delete = UITableViewRowAction(style: .normal, title: LocalizedString.delete) { action, index in
            self.showHud()
            self.viewModel.deleteCategory(category: self.viewModel.categoriesList[editActionsForRowAt.row], completion: { [weak self] result in
                switch result {
                case .success:
                    self?.tableView.reloadData()
                    self?.hideHud()
                case .failure(let error):
                    self?.showError(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
                }
            })
        }
        delete.backgroundColor = UIColor(red:0.69, green:0.25, blue:0.24, alpha:1.0)
        
        return [edit, delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func addCategory() {
        pushViewFromStoryboard(controller: Wireframe.CategoryView().category())
    }
}

fileprivate extension LocalizedString {
    static let title = NSLocalizedString("booktrix.categories.title", comment: "Categories")
}
