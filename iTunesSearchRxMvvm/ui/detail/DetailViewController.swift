//
//  DetailViewController.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/24.
//

import UIKit
import AVKit
import RxCocoa
import RxSwift
import Kingfisher

final class DetailViewController: BaseViewController<DetailViewModel> {
 
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var tradeNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    private var avPlayerLoop: AVPlayerLooper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModelBind()
    }
    
    private func setupViewModelBind() {
        viewModel.searchInfo
            .map { $0.imageUrl }
            .flatMap { Observable.of($0, $0.replacingOccurrences(of: "100x100", with: "200x200")) }
            .flatMap { $0.downloadImage() }
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
        viewModel.searchInfo
            .map { $0.previewUrl }
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] previewUrl in
                self?.startPreview(previewUrl)
            })
            .disposed(by: disposeBag)
    }
    
    private func startPreview(_ previewUrl: String) {
        guard let url = URL(string: previewUrl) else { return }
        
        let avPlayerItem: AVPlayerItem = .init(url: url)
        let avPlayer = AVQueuePlayer(playerItem: avPlayerItem)
        avPlayer.play()
        avPlayerLoop = AVPlayerLooper(player: avPlayer, templateItem: avPlayerItem)
    }
    
}
