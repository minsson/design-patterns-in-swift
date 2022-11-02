//
//  main.swift
//  Factory-Minsson
//
//  Created by minsson on 2022/10/26.
//

import Foundation

/*
 Creator 프로토콜은 Product 클래스의 새로운 인스턴스를 반환할 factory method를 선언한다. Creator 프로토콜을 채택한 클래스들은 factory method에 대한 구현을 제공한다.
 */

protocol Creator {

    /// Note that the Creator may also provide some default implementation of
    /// the factory method.
    // Creator 프로토콜은 factory method의 약간의 기본 구현도 제공할 수 있다.
    func factoryMethod() -> Product

    /*
     Creator라는 이름에도 불구하고, Creator의 우선적인 역할은 products를 create하는 게 아니다. 일반적으로 Creator는 factory method에 의해 리턴된 Product 객체에 기반한 코어 비즈니스 로직을 포함한다. Creator를 채택한 타입들은 factory method를 오버라이드해 다른 타입의 product를 반환함으로써 비즈니스 로직을 간접적으로 바꾼다.
     */
    func someOperation() -> String
}

// Creator의 extension을 통해 기본 동작을 구현한다. 이 동작들은 Creator를 채택한 곳에서 오버라이드될 수 있다.
extension Creator {

    func someOperation() -> String {
        // Product 인스턴스를 생성하기 위해 factory method를 호출한다.
        let product = factoryMethod()

        // 만들어진 product를 사용한다.
        return "Creator: The same creator's code has just worked with " + product.operation()
    }
}

// Creator의 구현클래스는 리턴되는 Product의 타입을 변경하기 위해 factory method를 오버라이드할 수 있다.
class ConcreteCreator1: Creator {

    /*
     구체 Product 타입이 메서드로부터 반환됨에도 불구하고, 메서드의 시그니처는 여전히 추상 Product 타입을 사용하고 있다. 이러한 방식으로 Creator는 구체 Product 클래스들로부터 독립적인 상태를 유지할 수 있다.
     */
    public func factoryMethod() -> Product {
        return ConcreteProduct1()
    }
}

class ConcreteCreator2: Creator {

    public func factoryMethod() -> Product {
        return ConcreteProduct2()
    }
}

// Product 프로토콜은 모든 구체 Product 타입들이 구현해야할 작업들을 선언한다.
protocol Product {

    func operation() -> String
}

// 구체 Product 타입들은 Product 프로토콜을 저마다 다르게 구현할 수 있다.
class ConcreteProduct1: Product {

    func operation() -> String {
        return "{Result of the ConcreteProduct1}"
    }
}

class ConcreteProduct2: Product {

    func operation() -> String {
        return "{Result of the ConcreteProduct2}"
    }
}

/*
 Client 코드는 구체 Creator 타입의 인스턴스와 함께 동작한다. 그 Creator 타입의 base protocol을 통해 동작하는 것이긴 하다. Client가 Creator와 base protocol(이 경우 추상 Creator 프로토콜)과 함께 동작하는 한, 아무 Creator의 하위클래스나 넘겨줄 수 있다.
 */

class Client {
    // ...
    static func someClientCode(creator: Creator) {
        print("Client: I'm not aware of the creator's class, but it still works.\n"
            + creator.someOperation())
    }
    // ...
}

/*
 어떻게 동작하는지 보자.
 앱은 설정이나 환경에 따라 Creator의 타입을 택한다.
 */
//
//print("App: Launched with the ConcreteCreator1.")
//Client.someClientCode(creator: ConcreteCreator1())
//
//print("\nApp: Launched with the ConcreteCreator2.")
//Client.someClientCode(creator: ConcreteCreator2())



