//
//  UserBookShowViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class UserBookShowViewController: UIViewController {

    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!

    var viewModel: UserBookShowViewModel!
    
    lazy var descriptionController : BookShowDescriptionViewController? = {
        let vc = Wireframe.UserBookShowView().description()
        vc.viewModel = BookShowDescriptionViewModel(self.viewModel.userBook)
        return vc
    }()
    
    lazy var detailsController : BookShowDetailsViewController? = {
        let vc = Wireframe.UserBookShowView().details()
        vc.viewModel = BookShowDetailsViewModel(self.viewModel.userBook)
        return vc
    }()
    
    
    private var activeController : UIViewController? {
        willSet {
            self.activeController?.view.removeFromSuperview()
            self.activeController?.removeFromParentViewController()
        }
        didSet {
            guard let newActive = self.activeController else { return }
            
            self.contentContainer.addSubview(newActive.view)
            
            let views : [String : UIView] = ["view": newActive.view]
            
            newActive.view.translatesAutoresizingMaskIntoConstraints = false
            
            let constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views) +
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
            
            NSLayoutConstraint.activate(constraints)
            
            addChildViewController(newActive)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchUserBook()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        switchToTabAtIndex(index: 0)
    }
    
    func fetchUserBook() {
        showHud()
        viewModel.show { [weak self] result in
            self?.hideHud()
            switch result {
            case .success:
                self?.fillFields()
            case .failure(let error):
                self?.showError(title: nil, subtitle: error.errorMessage, dismissDelay: 3.0)
            }
        }
    }
    
    func fillFields() {
        titleLabel.text = viewModel.userBook.book.title
        authorLabel.text = viewModel.userBook.book.author
        
        if let url = URL(string: viewModel.userBook.book.image ?? "") {
            coverImage.setImage(.url(url))
        }
    }
    
    func editAction() {
        let vc = Wireframe.UserBookEditView().userBook()
        vc.viewModel = UserBookViewModel(.edit(viewModel.userBook))
        pushViewFromStoryboard(controller: vc)
    }
    
    @IBAction func changeTab(_ sender: Any) {
        switchToTabAtIndex(index: segmentedControl.selectedSegmentIndex)
    }
    
    private func switchToTabAtIndex(index: Int) {
        self.activeController = index == 0 ? self.descriptionController : self.detailsController
        segmentedControl.selectedSegmentIndex = index
    }

}
