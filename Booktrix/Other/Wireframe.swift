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
    
    struct RootView: StoryboardWireframe {
        let storyboardName: String = "RootView"
        func root() -> RootViewController {
            return instantiatior.initial()
        }
    }
    
    struct SettingsView: StoryboardWireframe {
        let storyboardName: String = "SettingsView"
        
        func settings() -> SettingsViewController {
            return instantiatior.initial()
        }
        
        func categories() -> CategoriesTableViewController {
            return instantiatior.initial()
        }
    }
    
    struct CategoriesView: StoryboardWireframe {
        let storyboardName: String = "CategoriesView"
        
        func categories() -> CategoriesTableViewController {
            return instantiatior.initial()
        }
    }
    
    struct CategoryView: StoryboardWireframe {
        let storyboardName: String = "CategoryView"
        
        func category() -> CategoryViewController {
            return instantiatior.initial()
        }
    }
    
    struct UserBookView: StoryboardWireframe {
        let storyboardName: String = "UserBookView"
        
        func userBook() -> UserBookViewController {
            return instantiatior.initial()
        }
    }

}
