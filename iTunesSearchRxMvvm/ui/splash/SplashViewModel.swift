//
//  File.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/21.
//

import Foundation
import RxSwift
import RxCocoa

class SplashViewModel: BaseViewModel {
    
    let showSearchView: BehaviorRelay<Int?> = BehaviorRelay.init(value: nil)
    
    override func start() {
        Observable<Int>.timer(.milliseconds(1500), scheduler: ConcurrentDispatchQueueScheduler.init(qos: .background))
            .take(1)
            .bind(to: showSearchView)
            .disposed(by: disposeBag)
    }
}
