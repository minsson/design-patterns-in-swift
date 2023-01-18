//
//  Observer_MinssonTests.swift
//  Observer-MinssonTests
//
//  Created by minsson on 2023/01/18.
//

import XCTest

final class Observer_MinssonTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test() {

        let cartManager = CartManager()

        // MARK: Subscriber 타입들의 인스턴스 생성
        let navigationBar = UINavigationBar()
        let cartVC = CartViewController()

        // MARK: CartManager의 변동 사항을 지켜보는 Subscriber 추가
        cartManager.add(subscriber: navigationBar)
        cartManager.add(subscriber: cartVC)

        // MARK: 이벤트가 발생하여 CartManager에 변동사항 발생
        let apple = Food(id: 111, name: "Apple", price: 10, calories: 20)
        cartManager.add(product: apple) // apple이 추가되고, add 내부의 notify를 통해 구독자들에게 알림

        let tShirt = Clothes(id: 222, name: "T-shirt", price: 200, size: "L")
        cartManager.add(product: tShirt) // tShirt가 추가되고, add 내부의 notify를 통해 구독자들에게 알림

        
        cartManager.remove(product: apple)
    }

}



protocol CartSubscriber: CustomStringConvertible {

    func accept(changed cart: [Product])
}

protocol Product {

    var id: Int { get }
    var name: String { get }
    var price: Double { get }

    func isEqual(to product: Product) -> Bool
}

extension Product {

    func isEqual(to product: Product) -> Bool {
        return id == product.id
    }
}

struct Food: Product {

    var id: Int
    var name: String
    var price: Double

    /// Food-specific properties
    var calories: Int
}

struct Clothes: Product {

    var id: Int
    var name: String
    var price: Double

    /// Clothes-specific properties
    var size: String
}

class CartManager {

    private lazy var cart = [Product]()
    private lazy var subscribers = [CartSubscriber]()

    func add(subscriber: CartSubscriber) {
        print("CartManager: I'am adding a new subscriber: \(subscriber.description)")
        subscribers.append(subscriber)
    }

    func add(product: Product) {
        print("\nCartManager: I'am adding a new product: \(product.name)")
        cart.append(product)
        notifySubscribers()
    }

    func remove(subscriber filter: (CartSubscriber) -> (Bool)) {
        guard let index = subscribers.firstIndex(where: filter) else { return }
        subscribers.remove(at: index)
    }

    func remove(product: Product) {
        guard let index = cart.firstIndex(where: { $0.isEqual(to: product) }) else { return }
        print("\nCartManager: Product '\(product.name)' is removed from a cart")
        cart.remove(at: index)
        notifySubscribers()
    }

    private func notifySubscribers() {
        print("CartManager: Notify 메서드를 통해 Subscriber들에게 알림 전달")
        subscribers.forEach({ $0.accept(changed: cart) })
    }
}

extension UINavigationBar: CartSubscriber {

    func accept(changed cart: [Product]) {
        print("UINavigationBar: CartManager에게 변동사항 Notify 받고, 장바구니 이미지 옆 숫자 변경함")
    }

    open override var description: String { return "UINavigationBar" }
}

class CartViewController: UIViewController, CartSubscriber {
    
    func accept(changed cart: [Product]) {
        print("CartViewController: CartManager에게 변동사항 Notify 받고, 장바구니 리스트 수정함")
    }
    
    open override var description: String { return "CartViewController" }
    
}

