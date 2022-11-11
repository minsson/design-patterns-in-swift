//
//  AbstractFactory.swift
//  AbstractFactoryPractice
//
//  Created by Kiwon Song on 2022/11/09.
//

import Foundation

class AbstractFactory {
    var factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
}

