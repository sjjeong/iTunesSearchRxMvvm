//
//  UIImageView+Extension.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func loadUrl(url: String) {
        self.kf.setImage(with: URL(string: url))
    }
    
}
