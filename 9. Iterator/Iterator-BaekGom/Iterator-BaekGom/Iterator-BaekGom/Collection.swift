//
//  Collection.swift
//  Iterator-BaekGom
//
//  Created by Baek on 2022/11/16.
//

import Foundation

final class MapCollection: Iterable {
    private var map: [String: String] = [:]
 
    func add(element: String, for key: String) {
        map.updateValue(element, forKey: key)
    }
 
    func makeIterator() -> defaultIterator<String> {
        return defaultIterator<String>(items: self.map.values.map({ $0 }))
    }
}
 
final class ListCollection: Iterable {
    private var list: [String] = []
 
    func add(element: String) {
        list.append(element)
    }
 
    func makeIterator() -> defaultIterator<String> {
        return defaultIterator<String>(items: self.list)
    }
}
