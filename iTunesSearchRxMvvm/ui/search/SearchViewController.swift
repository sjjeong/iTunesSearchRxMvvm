//
//  SearchViewController.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/17.
//

import UIKit
import RxCocoa
import RxSwift

class SearchViewController: BaseViewController<SearchViewModel> {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        setupUiBind()
        setupViewModelBind()
    }
    
    private func setupUi() {
        searchInfoTableView.register(UINib(nibName: "SearchInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchInfoTableViewCell")
        searchInfoTableView.tableFooterView = UIView()
    }
    
    private func setupUiBind() {
        searchBar.rx
            .text
            .orEmpty
            .bind(to: viewModel.query)
            .disposed(by: disposeBag)
        searchInfoTableView.rx
            .itemSelected
            .asDriver()
            .drive(onNext: { [weak self] in
                self?.viewModel.onItemSelect($0)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupViewModelBind() {
        viewModel.searchInfoList
            .asDriver()
            .drive(searchInfoTableView.rx.items(cellIdentifier: "SearchInfoTableViewCell")) { (index: Int, item: SearchInfoModel, cell: SearchInfoTableViewCell) in
                cell.bind(item)
            }
            .disposed(by: disposeBag)
        viewModel.showDetailEvent
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] item in
                self?.showDetail(item)
            })
            .disposed(by: disposeBag)
    }
    
    private func showDetail(_ searchInfo: SearchInfoModel) {
        let vc = DiContainer.instance.container.resolve(DetailViewController.self, argument: searchInfo)!
        present(vc, animated: true, completion: nil)
    }
}
