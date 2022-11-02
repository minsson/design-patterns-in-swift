//
//  ProblemCode.swift
//  Factory-Minsson
//
//  Created by minsson on 2022/10/27.
//

import Foundation

class OurCompanyApp {
    static let truckingCompany = TruckingCompany_Before() // 우리 운송 업체
    static let shippingCompany = ShippingCompany_Before()

    static func orderDelivery(to company: TransportationProviderCompany_Before) {
        switch company {
        case .truckingCompany:
            print("\(truckingCompany.name)에게 운송을 의뢰하겠습니다.")
            truckingCompany.planDelivery()
        case .shippingCompany:
            print("\(shippingCompany.name)에게 운송을 의뢰하겠습니다.")
            shippingCompany.planDelivery()
        }
    }
}

enum TransportationProviderCompany_Before {
    case truckingCompany
    case shippingCompany
}

class TruckingCompany_Before {
    class Truck {
        func deliver() {
            print("트럭으로 운송합니다.")
        }
    }

    let name = "트럭운송 전문회사"

    func planDelivery() {
        print("안녕하세요, \(name) 입니다.")
        let truck = createTruck()
        truck.deliver()
    }

    func createTruck() -> Truck {
        print("트럭이 배차되었습니다.")
        return Truck()
    }
}

class ShippingCompany_Before {
    class Ship {
        func deliver() {
            print("선박으로 운송합니다.")
        }
    }

    let name = "선박 운송 전문회사"

    func planDelivery() {
        print("안녕하세요, \(name) 입니다.")
        let ship = createShip()
        ship.deliver()
    }

    func createShip() -> Ship {
        print("선박이 예약되었습니다.")
        return Ship()
    }
}
