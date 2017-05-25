//
//  StartViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 25.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let rootViewController: UIViewController
        
        if let _ = KeychainStorage().getUser() {
            rootViewController = Wireframe.RootView().root()
        } else {
            rootViewController = Wireframe.SignInView().signIn()
        }
        
        setNewRoot(controller: rootViewController)
    }

}
