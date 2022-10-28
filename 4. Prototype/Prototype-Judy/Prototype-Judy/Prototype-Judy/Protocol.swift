//
//  Protocol.swift
//  Prototype-Judy
//
//  Created by Judy on 2022/10/25.
//

protocol Prototype {
    init(_ type: Self)
}

extension Prototype {
    func clene() -> Self {
        return type(of: self).init(self)
    }
}
