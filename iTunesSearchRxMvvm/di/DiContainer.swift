//
//  DependencyContainer.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/17.
//

import UIKit
import Swinject

class DiContainer {
    static let instance: DiContainer = DiContainer()
    let container = Container()
    
    private init() {
        self.setupViewController()
        self.setupViewModel()
        self.setupNetwork()
    }
}

// ViewController
extension DiContainer {
    private func setupViewController() {
        self.container.register(SplashViewController.self) { r in
            let storyboard = UIStoryboard(name: "Splash", bundle: .main)
            return (storyboard.instantiateInitialViewController() as! SplashViewController).then {
                $0.viewModel = r.resolve(SplashViewModel.self)
            }
        }
        self.container.register(SearchViewController.self) { r in
            let storyboard = UIStoryboard(name: "Search", bundle: .main)
            return (storyboard.instantiateInitialViewController() as! SearchViewController).then {
                $0.viewModel = r.resolve(SearchViewModel.self)
            }
        }
        self.container.register(DetailViewController.self) { (r: Resolver, searchInfo: SearchInfoModel) in
            let storyboard = UIStoryboard(name: "Detail", bundle: .main)
            return (storyboard.instantiateInitialViewController() as! DetailViewController).then {
                $0.viewModel = r.resolve(DetailViewModel.self, argument: searchInfo)
            }
        }
    }
}

// ViewModel
extension DiContainer {
    private func setupViewModel() {
        self.container.register(SplashViewModel.self) { _ in
            SplashViewModel()
        }
        self.container.register(SearchViewModel.self) { r in
            SearchViewModel(apiService: r.resolve(ApiServiceType.self)!)
        }
        self.container.register(DetailViewModel.self) { _, searchInfo in
            DetailViewModel(searchInfo: searchInfo)
        }
    }
}

// Network
extension DiContainer {
    private func setupNetwork() {
        self.container.register(ApiServiceType.self) { _ in
            ApiService()
        }
    }
}
