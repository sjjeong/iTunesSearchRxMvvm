//
//  ViewController.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/17.
//

import UIKit
import RxSwift
import RxCocoa

class SplashViewController: UIViewController {

    private let disposeBag: DisposeBag = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Observable<Int>.timer(.milliseconds(1500), scheduler: ConcurrentDispatchQueueScheduler.init(qos: .background))
            .take(1)
            .observe(on: MainScheduler.instance)
            .subscribe(onCompleted: {
                self.presentSearchViewController()
            })
            .disposed(by: disposeBag)
    }
    
    private func presentSearchViewController() {
        let vc = DiContainer.instance.container.resolve(SearchViewController.self)!
        self.view.window?.rootViewController = vc
    }


}

