//
//  main.swift
//  Strategy-wongbing
//
//  Created by 이원빈 on 2022/11/16.
//

// MARK: - Bad Example
class Client2 {
    func travel(from a: String, to b: String, with transport: String) {
        let context = Context2()
        switch transport {
        case "bus":
            context.useBus(from: a, to: b)
        case "taxi":
            context.useTaxi(from: a, to: b)
        case "airplane":
            context.useAirplane(from: a, to: b)
        default:
            return
        }
        // Bad! : 알고리즘이 추가될 때마다 이곳의 case 가 늘어날 것이다.
    }
}

let kiwi = Client2()
kiwi.travel(from: "서울", to: "부산", with: "bus")

// MARK: - Good Example

class Client1 {
    func travel(from a: String, to b: String, with strategy: RouteStrategy) {
        let context = Context()
        context.setStrategy(strategy)
        context.move(from: a, to: b)
    }
}

let bus = Bus()
let taxi = Taxi()
let airplane = Airplane()
// Good! : 알고리즘이 추가될 때마다 구상전략 객체만 늘어날 뿐, Client 클래스에 영향을 미치지 않는다.

let wongbing = Client1()
wongbing.travel(from: "인천", to: "부산", with: bus)
