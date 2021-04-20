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
        self.container.register(SearchViewController.self) { _ in
            let storyboard = UIStoryboard(name: "Search", bundle: .main)
            return storyboard.instantiateInitialViewController() as! SearchViewController
        }
    }
}

// ViewModel
extension DiContainer {
    private func setupViewModel() {
        self.container.register(SplashViewModel.self) { _ in
            SplashViewModel()
        }
    }
}
