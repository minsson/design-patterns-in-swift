//
//  DefaultIterator.swift
//  Iterator-BaekGom
//
//  Created by Baek on 2022/11/16.
//

import Foundation

final class defaultIterator<T>: Iterator {
    typealias Element = T
    private var items: [Element] = []
    private var current = 0
    
    init(items: [Element]) {
        self.items = items
    }
    
    func next() -> Element? {
        guard hasNext() else { return  nil }
        defer { self.current += 1 }
        
        return items[current]
    }
    
    func hasNext() -> Bool {
        current < items.count
    }
}
