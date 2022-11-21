//
//  Strategy.swift
//  Strategy-Minsson
//
//  Created by minsson on 2022/11/16.
//

// MARK: - Strategy

protocol Strategy {
    
    func algorithmExecute() -> String
    
}

// MARK: - Context

final class Navigation {
    
    private var routeAlgorithm: Strategy?
    
    func execute() -> String {
        guard let routeAlgorithm = routeAlgorithm else {
            return ""
        }
        
        return routeAlgorithm.algorithmExecute()
    }
    
    func setStrategy(strategy: Strategy) {
        self.routeAlgorithm = strategy
    }
    
}

// MARK: - Concrete Strategy

final class CarRoute: Strategy {
    
    func algorithmExecute() -> String {
        return "자동차 경로 탐색 알고리즘 실행 완료"
    }
    
}

final class WalkRoute: Strategy {
    
    func algorithmExecute() -> String {
        return "도보 경로 탐색 알고리즘 실행 완료"
    }
    
}

final class BicycleRoute: Strategy {
    
    func algorithmExecute() -> String {
        return "자전거 경로 탐색 알고리즘 실행 완료"
    }
    
}

final class PublicTransportationRoute: Strategy {
    
    func algorithmExecute() -> String {
        return "대중교통 경로 탐색 알고리즘 실행 완료"
    }
    
}

final class QuickboardRoute: Strategy {
    
    func algorithmExecute() -> String {
        return "퀵보드 경로 탐색 알고리즘 실행 완료"
    }
    
}
