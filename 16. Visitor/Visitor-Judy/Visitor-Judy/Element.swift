//
//  Element.swift
//  Visitor-Judy
//
//  Created by Judy on 2023/01/18.
//

protocol Element {
    func accept(_ visitor: Visitor)
    
    //설명용으로 추가한 프로퍼티
    var money: Int { get set }
}

struct Gold: Element {
    var money = 100000
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}

struct Silver: Element {
    var money = 10000
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}

struct Bronze: Element {
    var money = 1000
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}
