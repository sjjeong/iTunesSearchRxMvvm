//
//  SearchInfoModel.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/24.
//

import Foundation

struct SearchInfoModel {
    let artistName: String
    let trackName: String
    let imageUrl: String
    let previewUrl: String
}

extension SearchInfoResponse {
    func toPresentation() -> SearchInfoModel {
        SearchInfoModel(
            artistName: artistName,
            trackName: trackName,
            imageUrl: artworkUrl100,
            previewUrl: previewUrl
        )
    }
}
