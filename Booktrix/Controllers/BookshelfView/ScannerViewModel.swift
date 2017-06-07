//
//  ScannerViewModel.swift
//  Booktrix
//
//  Created by Impresyjna on 07.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit

class ScannerViewModel: NSObject {
    let delegate: UserBookProtocol
    
    init(_ delegate: UserBookProtocol) {
        self.delegate = delegate
    }
}
