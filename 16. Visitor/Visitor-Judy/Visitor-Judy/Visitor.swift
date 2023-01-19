//
//  Visitor.swift
//  Visitor-Judy
//
//  Created by Judy on 2023/01/18.
//

import Foundation

protocol Visitor {
    func visit(_ membership: Gold)
    func visit(_ membership: Silver)
    func visit(_ membership: Bronze)
//    func visit(_ membership: Element)
}

struct DiscountVisitor: Visitor {
//    func visit(_ membership: Element) {
//        if membership is Gold {
//
//        } //...
//    }
    
    func visit(_ membership: Gold) {
        print("30% 할인돼서 \(Int(Double(membership.money) * 0.7))원입니다.")
    }
    
    func visit(_ membership: Silver) {
        print("20% 할인돼서 \(Int(Double(membership.money) * 0.8))원입니다.")
    }
    
    func visit(_ membership: Bronze) {
        print("10% 할인돼서 \(Int(Double(membership.money) * 0.9))원입니다.")
    }
}

struct PointVisitor: Visitor {
    func visit(_ membership: Gold) {
        let point = Int(Double(membership.money) * 0.1)
        print("10% 적립으로 \(point)원 적립됩니다.")
    }
    
    func visit(_ membership: Silver) {
        let point = Int(Double(membership.money) * 0.05)
        print("5% 적립으로 \(point)원 적립됩니다.")
    }
    
    func visit(_ membership: Bronze) {
        let point = Int(Double(membership.money) * 0.01)
        print("1% 적립으로 \(point)원 적립됩니다.")
    }
}
