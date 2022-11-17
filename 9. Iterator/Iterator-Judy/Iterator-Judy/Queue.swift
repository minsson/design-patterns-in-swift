//
//  Queue.swift
//  Iterator-Judy
//
//  Created by Judy on 2022/11/15.
//

protocol CollectionItem {}

extension Int: CollectionItem { }

// Concrete Collection 2 - 큐
class Queue<Item: CollectionItem>: Collection {
    private var enqueueItems: [Item]
    private var dequeueItems: [Item] = []
    
    var items: [CollectionItem] {
        get {
            return dequeueItems.reversed() + enqueueItems
        }
    }
    
    var isEmpty: Bool {
        return enqueueItems.isEmpty && dequeueItems.isEmpty
    }
    
    init(_ items: [Item] = []) {
        self.enqueueItems = items
    }
    
    func enqueue(_ element: Item) {
        enqueueItems.append(element)
    }
    
    func dequeue() -> Item? {
        guard !isEmpty else { return nil }
        
        if dequeueItems.isEmpty {
            dequeueItems = enqueueItems.reversed()
            enqueueItems.removeAll()
        }
        
        return dequeueItems.popLast()
    }
    
    func createIterator(type: Iterator) -> Iterable {
        switch type {
        case .basic:
            return BasicIterator<Item>(collection: self)
        case .reversed:
            return ReversedIterator<Item>(collection: self)
        }
    }
}
