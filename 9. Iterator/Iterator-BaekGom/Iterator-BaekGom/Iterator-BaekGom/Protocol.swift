//
//  Protocol.swift
//  Iterator-BaekGom
//
//  Created by Baek on 2022/11/16.
//

import Foundation

protocol Iterable {
    associatedtype Iterator
    func makeIterator() -> Iterator
}

protocol Iterator {
    associatedtype Element
    func hasNext() -> Bool
    func next() -> Element?
}
