//
//  Prototype.swift
//  Prototype-Kiwi
//
//  Created by Kiwon Song on 2022/10/26.
//

protocol Prototype {
    init(prototype: Self)
}

extension Prototype {
    func clone() -> Self {
        return type(of: self).init(prototype: self)
    }
}
