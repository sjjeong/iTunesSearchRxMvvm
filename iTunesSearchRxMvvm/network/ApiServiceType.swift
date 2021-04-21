//
//  ApiServiceType.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/21.
//

import Foundation
import RxSwift

protocol ApiServiceType {
    func getSearchInfo(query: String) -> Single<SearchResponse>
}
