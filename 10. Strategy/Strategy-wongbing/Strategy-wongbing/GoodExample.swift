//
//  GoodExample.swift
//  Strategy-wongbing
//
//  Created by 이원빈 on 2022/11/16.
//

protocol RouteStrategy {
    func buildRoute(from a: String, to b: String)
}

struct Bus: RouteStrategy {
    func buildRoute(from a: String, to b: String) {
        print("\(a)에서 가까운 버스정류장을 찾는다")
        print("버스를 타고 \(b)로 이동")
    }
}

struct Taxi: RouteStrategy {
    func buildRoute(from a: String, to b: String) {
        print("택시를 \(a)로 부른다")
        print("택시를 타고 \(b)로 이동")
    }
}

struct Airplane: RouteStrategy {
    func buildRoute(from a: String, to b: String) {
        print("\(a) 에서 가까운 공항을 찾아 간다")
        print("비행기를 타고 \(b)로 이동")
    }
}

// Good! : 알고리즘이 추가되면 구상전략만 추가될 뿐, Context에는 영향을 미치지 않는다.

class Context {
    private var strategy: RouteStrategy?
    
    func setStrategy(_ strategy: RouteStrategy) {
        self.strategy = strategy
    }
    
    func move(from a: String, to b: String) {
        strategy?.buildRoute(from: a, to: b)
    }
}
