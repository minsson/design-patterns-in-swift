//
//  Iterator.swift
//  Iterator-Judy
//
//  Created by Judy on 2022/11/15.
//

protocol Iterable {
    func getNext() -> CollectionItem
    func hasNext() -> Bool
}

// Iterator 종류
enum Iterator {
    case basic
    case reversed
}

// Concrete Iterator 1 - 순차 탐색
class BasicIterator<Item: CollectionItem>: Iterable {
    let collection: Collection
    var items: [CollectionItem]
    
    init(collection: Collection) {
        self.collection = collection
        self.items = collection.items
    }
    
    func getNext() -> CollectionItem {
        return items.removeFirst()
    }
    
    func hasNext() -> Bool {
        return items.isEmpty == false
    }
}

// Concrete Iterator 2 - 역순 탐색
class ReversedIterator<Item: CollectionItem>: Iterable {
    let collection: Collection
    var items: [CollectionItem]
    
    init(collection: Collection) {
        self.collection = collection
        self.items = collection.items
    }
    
    func getNext() -> CollectionItem {
        return items.removeLast()
    }
    
    func hasNext() -> Bool {
        return items.isEmpty == false
    }
}
