//
//  SearchResponse.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/21.
//

import Foundation

struct SearchResponse: Decodable {
    let resultCount: Int
    let results: [SearchInfoResponse]
}
