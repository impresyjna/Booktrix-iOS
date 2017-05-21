//
//  Instantiatior.swift
//  Booktrix
//
//  Created by Impresyjna on 21.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

final class Instantiatior {
    let wireframe: StoryboardWireframe
    
    init(wireframe: StoryboardWireframe) {
        self.wireframe = wireframe
    }
    
    func identifiable<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        return wireframe.storyboard.instantiateViewController(withIdentifier: T.identifier) as! T
    }
    
    func initial<T: UIViewController>() -> T {
        return wireframe.storyboard.instantiateInitialViewController() as! T
    }
}
