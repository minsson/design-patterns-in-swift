//
//  Example.swift
//  TemplateMethod-wongbing
//
//  Created by 이원빈 on 2022/11/09.
//

protocol AbstractProtocol {
    func templateMethod()
    func baseOperation1()
    func baseOperation2()
    func baseOperation3()
    
    func requiredOperation1()
    func requiredOperation2()
    
    func hook1()
    func hook2()
}

extension AbstractProtocol {
    func templateMethod() {
        baseOperation1()
        requiredOperation1()
        baseOperation2()
        hook1()
        requiredOperation2()
        baseOperation3()
        hook2()
    }
    
    func baseOperation1() {
        print("기본 작업 1")
    }
    
    func baseOperation2() {
        print("기본 작업 2")
    }
    
    func baseOperation3() {
        print("기본 작업 3")
    }
    
    func hook1() {}
    func hook2() {}
}

class ConcreteClass1: AbstractProtocol {
    func requiredOperation1() {
        print(#function)
    }
    
    func requiredOperation2() {
        print(#function)
    }
    
    func hook2() {
        print(#function)
    }
}

class ConcreteClass2: AbstractProtocol {
    func requiredOperation1() {
        print(#function)
    }
    
    func requiredOperation2() {
        print(#function)
    }
    
    func hook1() {
        print(#function)
    }
}
