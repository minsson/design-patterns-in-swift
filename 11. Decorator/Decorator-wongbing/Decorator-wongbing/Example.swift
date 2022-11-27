//
//  Example.swift
//  Decorator-wongbing
//
//  Created by 이원빈 on 2022/11/22.
//

//protocol Component {
//    
//    func operation() -> String
//}
//
//class ConcreteComponent: Component {
//    
//    func operation() -> String {
//        return "ConcreteComponent"
//    }
//}
//
//class Decorator: Component {
//    
//    private var component: Component
//    
//    init(_ component: Component) {
//        self.component = component
//    }
//    
//    func operation() -> String {
//        return component.operation()
//    }
//}
//
//class ConcreteDecoratorA: Decorator {
//    
//    override func operation() -> String {
//        return "ConcreteDecoratorA(" + super.operation() + ")"
//    }
//}
//
//class ConcreteDecoratorB: Decorator {
//    
//    override func operation() -> String {
//        return "ConcreteDecoratorB(" + super.operation() + ")"
//    }
//}
//
//class Client {
//    
//    static func someClientCode(component: Component) {
//        print("Result: " + component.operation())
//    }
//}
//
//func testDecoratorConceptual() {
//    print("Client: I've got a simple component")
//    let simple = ConcreteComponent()
//    Client.someClientCode(component: simple)
//    
//    let decorator1 = ConcreteDecoratorA(simple)
//    let decorator2 = ConcreteDecoratorB(decorator1)
//    print("\nClient: Now I've got a decorated component")
//    Client.someClientCode(component: decorator2)
//}


