//
//  UIImageView+LoadImage.swift
//  Booktrix
//
//  Created by Impresyjna on 10.06.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import UIKit
import Kingfisher

enum Image {
    case url(URL)
    case image(UIImage)
    case data(Data)
}

extension UIImageView {

    func setImage(_ image: Image) {
        switch image {
        case Image.url(let url):
            self.kf.setImage(with: url)
        case Image.image(let image):
            self.image = image
        case Image.data(let data):
            self.image = UIImage(data: data)
        }
    }
}
