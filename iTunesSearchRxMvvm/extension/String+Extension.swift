//
//  String+Extension.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/24.
//

import Foundation
import RxSwift
import Kingfisher

extension String {
    
    func downloadImage() -> Observable<UIImage> {
        Observable.create { observer in
            guard let url = URL(string: self) else {
                return Disposables.create()
            }
            let imageResource = ImageResource(downloadURL: url)
            KingfisherManager.shared.retrieveImage(with: imageResource) { result in
                switch result {
                case .success(let value):
                    observer.on(.next(value.image))
                case .failure(let error):
                    observer.on(.error(error))
                }
            }
            return Disposables.create()
        }
    }
    
}
