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
    
    struct UserBookEditView: StoryboardWireframe {
        let storyboardName: String = "UserBookEditView"
        
        func userBook() -> UserBookViewController {
            return instantiatior.initial()
        }
        
        func description() -> BookDescriptionViewController {
            return instantiatior.identifiable()
        }
        
        func details() -> BookDetailsViewController {
            return instantiatior.identifiable()
        }
        
        func scanner() -> ScannerViewController {
            return instantiatior.identifiable()
        }
    }
    
    struct UserBookShowView: StoryboardWireframe {
        let storyboardName: String = "UserBookShowView"
        
        func userBook() -> UserBookShowViewController {
            return instantiatior.initial()
        }
        
        func description() -> BookShowDescriptionViewController {
            return instantiatior.identifiable()
        }
        
        func details() -> BookShowDetailsViewController {
            return instantiatior.identifiable()
        }
    }
    
    struct FriendsView: StoryboardWireframe {
        let storyboardName: String = "FriendsView"
        
        func addFriend() -> AddFriendViewController {
            return instantiatior.identifiable()
        }
        
        func friend() -> FriendViewController {
            return instantiatior.identifiable()
        }
    }
}
