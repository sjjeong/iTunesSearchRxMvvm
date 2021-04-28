//
//  ApiService.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/21.
//

import Foundation
import RxSwift
import Alamofire

final class ApiService: ApiServiceType {
    
    func getSearchInfo(query: String) -> Single<SearchResponse> {
        return Single<SearchResponse>.create { observer in
            let url = "https://itunes.apple.com/search"
            AF.request(
                url,
                method: .get,
                parameters: ["term":query, "media":"music"])
                .validate()
                .responseDecodable(of: SearchResponse.self) { response in
                    switch response.result {
                    case .success(let data):
                        observer(.success(data))
                    case .failure(let error):
                        observer(.failure(error))
                    }
                }
            return Disposables.create()
        }
    }
    
}
