//
//  CustomView.swift
//  FactoryPattern
//
//  Created by 오경식 on 2022/10/24.
//

import UIKit
//MARK: interface
protocol MacBook {
    var name: String { get set }
    init(name: String, screen: Int, memory: String)
    func printSpec()
    func changeName(changeName: String)
}

//MARK: Concrete Product
class MacBookPro: MacBook {
    var name: String
    var screen: Int
    var memory: String

    required init(name: String, screen: Int, memory: String) {
        self.name = name
        self.screen = screen
        self.memory = memory
    }

    func printSpec() {
        print("맥북이름 : \(name), 화면크기 : \(screen), 메모리 : \(memory)")
    }

    func changeName(changeName: String) {
        print("\(self.name)에서 \(changeName)로 이름 변경")
        self.name = changeName
    }
}

class MacBookAir: MacBook {
    var name: String
    var screen: Int
    var memory: String

    required init(name: String, screen: Int, memory: String) {
        self.name = name
        self.screen = screen
        self.memory = memory
    }

    func printSpec() {
        print("맥북이름 : \(name), 화면크기 : \(screen), 메모리 : \(memory)")
    }

    func changeName(changeName: String) {
        print("\(self.name)에서 \(changeName)로 이름 변경")
        self.name = changeName
    }
}

//MARK: Creator
protocol MacBookCreator {
    func createMacBook(name: String, level: MacType) -> MacBook
}

enum MacType {
    case air, pro
}

//MARK: Factory (Concrete Creator)
class MacBookFactory: MacBookCreator {
    func createMacBook(name: String, level: MacType) -> MacBook  {
        switch level {
        case .air:
            return MacBookAir(name: "\(name)'s MacBookAir", screen: 13, memory: "16GB")
        case .pro:
            return MacBookPro(name: "\(name)'s MacBookPro", screen: 16, memory: "32GB")
        }
    }
}


