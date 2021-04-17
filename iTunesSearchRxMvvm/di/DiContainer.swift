//
//  DependencyContainer.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/17.
//

import Foundation
import Swinject

class DiContainer {
    static let instance: DiContainer = DiContainer()
    let container = Container()
    
    private init() {
        
    }
}
