//
//  main.swift
//  TemplateMethod
//
//  Created by 오경식 on 2022/11/07.
//

import Foundation

class MakeCoffee {

    final func makeCoffee() {
        roastCoffe()
        grindCoffeeBeans()
        brewEspresso()
        print("커피가 완성되었습니다.")
    }

    func roastCoffe() {
        print("커피콩을 볶았습니다.")
    }

    func grindCoffeeBeans() {
        print("볶아진 커피콩을 갈았습니다.")
    }

    func brewEspresso() {
        print("에스프레소를 추출합니다.")
    }
}

class BaristaUnchain: MakeCoffee {
    override func roastCoffe() {
        print("커피콩을 강한불로 볶습니다.")
    }
}

class BaristaJudy: MakeCoffee {
    override func brewEspresso() {
        print("에스프레소 추출양을 2배로 추출합니다.")
    }
}

class BaristaWingBong: MakeCoffee {
    override func grindCoffeeBeans() {
        print("커피콩을 매우 가늘게 갈았습니다.")
    }
}

enum Barista {
    case unchain
    case judy
    case wingbong
}

class Customer {
    static func orderCoffee(barista: Barista) {
        switch barista {
        case .unchain:
            BaristaUnchain().makeCoffee()
        case .judy:
            BaristaJudy().makeCoffee()
        case .wingbong:
            BaristaWingBong().makeCoffee()
        }
    }
}

Customer.orderCoffee(barista: .unchain)
Customer.orderCoffee(barista: .judy)
Customer.orderCoffee(barista: .wingbong)
