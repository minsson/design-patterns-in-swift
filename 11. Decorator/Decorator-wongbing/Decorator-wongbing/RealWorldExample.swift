//
//  RealWorldExample.swift
//  Decorator-wongbing
//
//  Created by 이원빈 on 2022/11/22.
//

protocol Component {
    func add() -> String
}

class BaseComponent: Component {
    
    func add() -> String {
        return "에스프레소"
    }
}

class Decorator: Component {
    private var coffeeComponent: Component
    
    init(coffeeComponent: Component) {
        self.coffeeComponent = coffeeComponent
    }
    
    func add() -> String {
        return coffeeComponent.add()
    }
}

class WaterDecorator: Decorator {
    override init(coffeeComponent: Component) {
        super.init(coffeeComponent: coffeeComponent)
    }
    
    override func add() -> String {
        return super.add() + " + 물"
    }
}

class MilkDecorator: Decorator {
    override init(coffeeComponent: Component) {
        super.init(coffeeComponent: coffeeComponent)
    }
    
    override func add() -> String {
        return super.add() + " + 우유"
    }
}


