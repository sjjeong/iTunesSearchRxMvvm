//
//  BaseViewController.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/21.
//

import UIKit
import RxSwift

class BaseViewController<VM: BaseViewModel>: UIViewController {
    let disposeBag: DisposeBag = DisposeBag()
    var viewModel: VM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.start()
    }
}
