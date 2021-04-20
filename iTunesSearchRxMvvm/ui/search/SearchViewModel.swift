//
//  SearchViewModel.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/21.
//

import Foundation
import RxRelay
import RxSwift

class SearchViewModel: BaseViewModel {
    
    let query: BehaviorRelay<String> = .init(value: "")
    
    override func start() {
        query.debounce(.milliseconds(200), scheduler: ConcurrentDispatchQueueScheduler.init(qos: .background))
            .subscribe(onNext: {
                print($0)
            })
        .disposed(by: disposeBag)
    }
    
}
