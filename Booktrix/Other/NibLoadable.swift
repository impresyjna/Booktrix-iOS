//
//  NibLoadable.swift
//  Booktrix
//
//  Created by Impresyjna on 27.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static var nibName: String { get }
    static var bundle: Bundle { get }
}

extension NibLoadable {
    
    static var bundle: Bundle {
        return .main
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension NibLoadable where Self: UIView {
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: bundle)
    }
    
    static var view: Self {
        return bundle.loadNibNamed(nibName, owner: nil, options: nil)?.first as! Self
    }
}
