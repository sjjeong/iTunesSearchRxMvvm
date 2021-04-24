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
    
    let apiService: ApiServiceType
    
    let query: BehaviorRelay<String> = .init(value: "")
    
    let searchInfoList: BehaviorRelay<[SearchInfoModel]> = .init(value: [])
    
    init(apiService: ApiServiceType) {
        self.apiService = apiService
    }
    
    override func start() {
        query.debounce(.milliseconds(200), scheduler: ConcurrentDispatchQueueScheduler.init(qos: .background))
            .flatMapLatest { [weak self] str -> Observable<SearchResponse> in
                guard let self = self else { return Observable.empty() }
                return self.apiService.getSearchInfo(query: str)
                    .asObservable()
            }
            .map { $0.results }
            .map { $0.map { $0.toPresentation() }}
            .bind(to: searchInfoList)
            .disposed(by: disposeBag)
    }
    
}
