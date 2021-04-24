//
//  DetailViewController.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/24.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

final class DetailViewController: BaseViewController<DetailViewModel> {
 
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var tradeNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModelBind()
    }
    
    private func setupViewModelBind() {
        viewModel.searchInfo
            .map { $0.imageUrl }
            .flatMap { imageUrl in
                Observable.of(imageUrl, imageUrl.replacingOccurrences(of: "100x100", with: "200x200"))
            }
            .flatMap { imageUrl in
                Observable.create { observer in
                    guard let url = URL(string: imageUrl) else {
                        return Disposables.create()
                    }
                    let imageResource = ImageResource(downloadURL: url)
                    KingfisherManager.shared.retrieveImage(with: imageResource) { result in
                        switch result {
                        case .success(let value):
                            observer.on(.next(value.image))
                        case .failure(let error):
                            observer.on(.error(error))
                        }
                    }
                    return Disposables.create()
                }
            }
            .asDriver(onErrorDriveWith: Driver.empty())
            .drive(trackImageView.rx.image)
            .disposed(by: disposeBag)
        viewModel.searchInfo
            .map { $0.trackName }
            .asDriver(onErrorDriveWith: Driver.empty())
            .drive(tradeNameLabel.rx.text)
            .disposed(by: disposeBag)
        viewModel.searchInfo
            .map { $0.artistName }
            .asDriver(onErrorDriveWith: Driver.empty())
            .drive(artistNameLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}
