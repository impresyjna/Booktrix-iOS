//
//  StoryboardWireframe.swift
//  Booktrix
//
//  Created by Impresyjna on 21.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

protocol StoryboardWireframe {
    var storyboardName: String { get }
    var bundle: Bundle? { get }
}

extension StoryboardWireframe {
    var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: bundle)
    }
    
    var bundle: Bundle? {
        return .main
    }
    
    var instantiatior: Instantiatior {
        return Instantiatior(wireframe: self)
    }
}
