//
//  ViewController.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/17.
//

import UIKit
import RxSwift
import RxCocoa

class SplashViewController: BaseViewController<SplashViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.showSearchView
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { _ in
                self.presentSearchViewController()
            })
            .disposed(by: disposeBag)
    }
    
    private func presentSearchViewController() {
        let vc = DiContainer.instance.container.resolve(SearchViewController.self)!
        self.view.window?.rootViewController = vc
    }

}

