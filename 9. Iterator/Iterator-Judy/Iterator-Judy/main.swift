//
//  main.swift
//  Iterator-Judy
//
//  Created by Judy on 2022/11/15.
//

let queue: Queue = Queue([1, 2, 3, 4, 5])
let basicIterator: Iterable = queue.createIterator(type: .basic)
let reversedIterator: Iterable = queue.createIterator(type: .reversed)

let list: List = List(list: [11, 22, 33, 44, 55])
let listBasicIterator: Iterable = list.createIterator(type: .basic)
let listReversedIterator: Iterable = list.createIterator(type: .reversed)

// Queue의 순차 탐색
while basicIterator.hasNext() {
    print(basicIterator.getNext())
}

// Queue의 역순 탐색
while reversedIterator.hasNext() {
    print(reversedIterator.getNext())
}

// List의 순차 탐색
while listBasicIterator.hasNext() {
    print(listBasicIterator.getNext())
}

// List의 역순 탐색
while listReversedIterator.hasNext() {
    print(listReversedIterator.getNext())
}

