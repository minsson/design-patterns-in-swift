//
//  main.swift
//  Factory-Wongbing
//
//  Created by 이원빈 on 2022/10/27.
//

class HyundaiOutlet { // 신발가게는 하나의 가게만 입점할 수 있다.
    var shoesStore: ShoesStore?
    init(shoesStore: ShoesStore? = nil) {
        self.shoesStore = shoesStore
    }
    func orderShoes(name: String) {
        let shoes = shoesStore?.orderShoes(name: name)
        print("\(shoes!.name!) 이 만들어 졌습니다")
    }
}

// MARK: - Creator
protocol ShoesStore { // 어떤 Shoes 를 반환하는 지는 하위에서 정해준다. 여기서 정하지 않는다.
    func orderShoes(name: String) -> Shoes?
    func makeShoes(name: String) -> Shoes?
}

extension ShoesStore {

    func orderShoes(name: String) -> Shoes? {
        var shoes: Shoes?
        shoes = makeShoes(name: name)
        shoes?.prepare()
        shoes?.packing()
        return shoes
    }
}

// MARK: - Concrete Creator 1
class JapanShoesStore: ShoesStore {
    func makeShoes(name: String) -> Shoes? {
        if name == "blackShoes" {
            return JPStyleBlackShoes()
        }
        return nil
    }
}
// MARK: - Concrete Creator 2
class FranceShoesStore: ShoesStore {
    func makeShoes(name: String) -> Shoes? {
        if name == "blackShoes" {
            return FRStyleBlackShoes()
        }
        return nil
    }
}

class Shoes {
    var name: String?
    var bottom: String?
    var leather: String?
    var hasPattern: Bool?
    var getName: String? {
        return name
    }

    func prepare() {
        print("완성된 신발을 준비 중입니다...")
    }

    func packing() {
        print("신발을 포장 하고 있습니다 ...")
    }
}

class JPStyleBlackShoes: Shoes {
    override init() {
        super.init()
        name = "일본 스타일의 검은 구두"
        bottom = "검은색 고무 밑창"
        leather = "소가죽"
        hasPattern = false
    }
}

class FRStyleBlackShoes: Shoes {
    override init() {
        super.init()
        name = "프랑스 스타일의 검은 구두"
        bottom = "옅은 검은색의 플라스틱과 고무 혼용"
        leather = "양가죽"
        hasPattern = true
    }
}

let tokyoStore = JapanShoesStore()
let franceStore = FranceShoesStore()

let outlet = HyundaiOutlet(shoesStore: franceStore) // tokyoStore 와 franceStore 를 갈아끼울 수 있다
outlet.orderShoes(name: "blackShoes")
