//
//  SearchViewController.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/17.
//

import UIKit
import RxCocoa

class SearchViewController: BaseViewController<SearchViewModel> {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.rx
            .text
            .orEmpty
            .bind(to: viewModel.query)
            .disposed(by: disposeBag)
    }
}
