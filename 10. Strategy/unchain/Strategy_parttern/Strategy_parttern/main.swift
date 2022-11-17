//
//  main.swift
//  Strategy_parttern
//
//  Created by 오경식 on 2022/11/14.
//

import Foundation

// MARK: Strategy

protocol Strategy {
    func 공유하기()
}

//MARK: Concrete Strategy

class KakaoTalk: Strategy {
    func 공유하기() {
        print("카카오톡으로 공유하기")
    }
}

class AirDrop: Strategy {
    func 공유하기() {
        print("에어드랍으로 공유하기")
    }
}

class Imessage: Strategy {
    func 공유하기() {
        print("아이메시지로 공유하기")
    }
}

class Mail: Strategy {
    func 공유하기() {
        print("메일로 공유하기")
    }
}

//MARK: Context
class ShareButton {
    private var shareAlgorithm: Strategy?

    func share() {
        self.shareAlgorithm?.공유하기()
    }

    func setStrategy(strategy: Strategy) {
        self.shareAlgorithm = strategy
    }
}

let shareButton = ShareButton()
shareButton.setStrategy(strategy: KakaoTalk())
shareButton.share()
