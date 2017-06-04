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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchCategories()
    }
    
    func fetchCategories() {
        showHud()
        viewModel.categoriesIndex { [weak self] result in
            switch result {
            case .success:
                self?.tableView.reloadData()
                self?.hideHud()
            case .failure(let error):
                self?.showError(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
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
            self.editCategory(self.viewModel.categoriesList[editActionsForRowAt.row])
        }
        edit.backgroundColor = UIColor(red:0.30, green:0.53, blue:0.66, alpha:1.0)
        
        let delete = UITableViewRowAction(style: .normal, title: LocalizedString.delete) { action, index in
            self.deleteCategory(self.viewModel.categoriesList[editActionsForRowAt.row])
        }
        delete.backgroundColor = UIColor(red:0.69, green:0.25, blue:0.24, alpha:1.0)
        
        return [edit, delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func categoryAction(_ categoryAction: CategoryAction) {
        let vc = Wireframe.CategoryView().category()
        vc.viewModel = CategoryViewModel(categoryAction)
        pushViewFromStoryboard(controller: vc)
    }
    
    func addCategory() {
        categoryAction(.add)
    }
    
    func editCategory(_ category: Category) {
        categoryAction(.edit(category))
    }
    
    func deleteCategory(_ category: Category) {
        showHud()
        viewModel.deleteCategory(category) { [weak self] result in
            switch result {
            case .success:
                self?.tableView.reloadData()
                self?.hideHud()
            case .failure(let error):
                self?.showError(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
    }
}

fileprivate extension LocalizedString {
    static let title = NSLocalizedString("booktrix.categories.title", comment: "Categories")
}
