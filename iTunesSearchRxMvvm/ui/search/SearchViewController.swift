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
    @IBOutlet weak var searchInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchInfoTableView.register(UINib(nibName: "SearchInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchInfoTableViewCell")
        
        searchBar.rx
            .text
            .orEmpty
            .bind(to: viewModel.query)
            .disposed(by: disposeBag)
        
        viewModel.searchInfoList
            .asDriver()
            .drive(searchInfoTableView.rx.items(cellIdentifier: "SearchInfoTableViewCell")) { (index: Int, item: SearchInfoResponse, cell: SearchInfoTableViewCell) in
                cell.bind(item)
            }
            .disposed(by: disposeBag)
    }
}
