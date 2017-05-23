//
//  Wireframe.swift
//  Booktrix
//
//  Created by Impresyjna on 21.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//
import UIKit

struct Wireframe {
    
    struct SignInView: StoryboardWireframe {
        let storyboardName: String = "SignInView"
        
        func signIn() -> SignInViewController {
            return instantiatior.identifiable()
        }
    }
    
    struct SignUpView: StoryboardWireframe {
        let storyboardName: String = "SignUpView"
        
        func signUp() -> SignUpViewController {
            return instantiatior.initial()
        }
    }
    
    struct ActivitiesView: StoryboardWireframe {
        let storyboardName: String = "ActivitiesView"
        
        func activities() -> ActivitiesViewController {
            return instantiatior.initial()
        }
    }
}
