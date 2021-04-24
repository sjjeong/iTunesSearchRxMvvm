//
//  DetailViewModel.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/24.
//

import Foundation
import RxSwift

final class DetailViewModel: BaseViewModel {
    
    let searchInfo: Observable<SearchInfoModel>
    
    init(searchInfo: SearchInfoModel) {
        self.searchInfo = Observable.just(searchInfo)
    }
    
}
