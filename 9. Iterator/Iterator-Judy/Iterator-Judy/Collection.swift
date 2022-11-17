//
//  Collection.swift
//  Iterator-Judy
//
//  Created by Judy on 2022/11/15.
//

protocol Collection {
    func createIterator(type: Iterator) -> Iterable
    var items: [CollectionItem] { get } // 탐색하기 위해 임의로 넣을 것이라 무시하셔도 됩니다
}

// Concrete Collection 1 - 리스트(일반 배열)
class List<Item :CollectionItem>: Collection {
    var list: [Item]
    var items: [CollectionItem] {
        return list
    }
    
    init(list: [Item] = []) {
        self.list = list
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
