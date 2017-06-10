//
//  FriendsViewController.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class FriendsViewController: UIViewController {

    let viewModel = FriendsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addFriendOpen(_ sender: Any) {
        let vc = Wireframe.FriendsView().addFriend()
        pushViewFromStoryboard(controller: vc)
    }
}
