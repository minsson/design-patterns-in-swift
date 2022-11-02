//
//  Prototype.swift
//  Prototype_Derrick
//
//  Created by Derrick kim on 2022/10/24.
// Protype Protocol

public protocol Prototype: AnyObject {
        init(prototype: Self)
}

extension Prototype {
        public func clone() -> Self {
                return type(of: self).init(prototype: self)
        }
}
