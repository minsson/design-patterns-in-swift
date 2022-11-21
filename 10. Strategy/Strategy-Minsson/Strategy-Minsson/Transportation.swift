//
//  Transportation.swift
//  Strategy-Minsson
//
//  Created by minsson on 2022/11/17.
//

enum Transportation {

    case walk
    case car
    case publicTransportation
    case bicycle
    case quickboard
    
    var description: String {
        switch self {
        case .walk:
            return "도보"
        case .car:
            return "자동차"
        case .publicTransportation:
            return "대중교통"
        case .bicycle:
            return "자전거"
        case .quickboard:
            return "퀵보드"
        }
    }
    
    var strategy: Strategy {
        switch self {
        case .walk:
            return WalkRoute()
        case .car:
            return CarRoute()
        case .publicTransportation:
            return PublicTransportationRoute()
        case .bicycle:
            return BicycleRoute()
        case .quickboard:
            return QuickboardRoute()
        }
    }
    
}
