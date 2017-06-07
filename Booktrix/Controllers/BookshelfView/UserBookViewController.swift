//
//  BookViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 04.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class UserBookViewController: UIViewController {
    
    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    var viewModel: UserBookViewModel!
    
    lazy var descriptionController : BookDescriptionViewController? = {
        return Wireframe.UserBookView().description()
    }()
    
    lazy var detailsController : BookDetailsViewController? = {
        return Wireframe.UserBookView().details()
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        switchToTabAtIndex(index: 0)
    }
    
    @IBAction func changeTab(_ sender: Any) {
        switchToTabAtIndex(index: segmentedControl.selectedSegmentIndex)
    }
    
    private func switchToTabAtIndex(index: Int) {
        self.activeController = index == 0 ? self.descriptionController : self.detailsController
        segmentedControl.selectedSegmentIndex = index
    }
    
    //TODO: 
    /* 
     * Zmniejszenie zdjęcia na mniejsze iPhony
     * Segmented controller
     * Akcja create
     * Akcja update
     * Wypełnianie danymi
     */
    
}
