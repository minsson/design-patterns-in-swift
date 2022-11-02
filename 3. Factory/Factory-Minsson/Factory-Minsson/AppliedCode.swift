//
//  AppliedCode.swift
//  Factory-Minsson
//
//  Created by minsson on 2022/10/26.
//

import Foundation

// MARK: - Client Code

class ForwarderCompany {
    static func orderDelivery(to logisticsCompany: TransportationProviderCompany) {
        // someClientCode
        print("TransportationProviderCompany를 채택하기만 하면 다 작동한다.")
        print("\(logisticsCompany.name)에 운송을 의뢰하겠습니다.")
        logisticsCompany.planDelivery()
        print()
    }
}

// MARK: - Creator Protocol

protocol TransportationProviderCompany {
    var name: String { get set }
    func planDelivery() // some operation
    func createTransport() -> Transport // factory method
}

extension TransportationProviderCompany {
    func planDelivery() {
        print("안녕하세요, \(name) 입니다.")
        let transport = createTransport()
        transport.deliver()
    }
}

// MARK: - Concrete Creator

class TruckingCompany: TransportationProviderCompany {
    var name = "육로운송 전문회사"

    func createTransport() -> Transport {
        print("트럭이 배차되었습니다.")
        return Truck()
    }
}

class ShippingCompany: TransportationProviderCompany {
    var name = "해상운송 전문회사"

    func createTransport() -> Transport {
        print("컨테이너선이 배정되었습니다.")
        return Ship()
    }
}

class AirShippingCompany: TransportationProviderCompany {
    var name = "항공운송 전문회사"

    func createTransport() -> Transport {
        print("비행기가 배정되었습니다.")
        return Airplane()
    }
}

// MARK: - Product Protocol

protocol Transport {
    func deliver()
}

// MARK: - Concrete Product

class Truck: Transport {
    func deliver() {
        print("육로로 운송하겠습니다.")
    }
}

class Ship: Transport {
    func deliver() {
        print("해상으로 운송하겠습니다.")
    }
}

class Airplane: Transport {
    func deliver() {
        print("항공으로 운송하겠습니다.")
    }
}
