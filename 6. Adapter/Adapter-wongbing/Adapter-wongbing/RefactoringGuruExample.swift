//
//  RefactoringGuruExample.swift
//  Adapter-wongbing
//
//  Created by 이원빈 on 2022/11/02.
//

//import Foundation
//
//class Target { // Client Interface
//
//    func request() -> String {
//        return "Target: The default target's behavior."
//    }
//}
//
//class Adaptee { // Service
//
//    public func specificRequest() -> String {
//        return ".eetpadA eht fo roivaheb laicepS"
//    }
//}
//
//
//class Adapter: Target { // Adapter
//    private var adaptee: Adaptee
//
//    init(_ adaptee: Adaptee) {
//        self.adaptee = adaptee
//    }
//
//    override func request() -> String {
//        return "Adapter: (TRANSLATED) " + adaptee.specificRequest().reversed()
//    }
//}
//
//class Client {
//
//    static func someClientCode(target: Target) {
//        print(target.request())
//    }
//}
//
//class AdapterConceptual {
//
//    func testAdapterConceptual() {
//        print("Client: I can work just fine with the Target objects:")
//        Client.someClientCode(target: Target())
//
//        let adaptee = Adaptee()
//        print("Client: The Adaptee class has a weird interface. See, I don't understand it:")
//        print("Adaptee: " + adaptee.specificRequest())
//
//        print("Client: But I can work with it via the Adapter:")
//        Client.someClientCode(target: Adapter(adaptee))
//    }
//}
