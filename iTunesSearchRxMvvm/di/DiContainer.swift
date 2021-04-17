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
    }
}

// ViewController
extension DiContainer {
    private func setupViewController() {
        self.container.register(SplashViewController.self) { _ in
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            return storyboard.instantiateInitialViewController() as! SplashViewController
        }
    }
}