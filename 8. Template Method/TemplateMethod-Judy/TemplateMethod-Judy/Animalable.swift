//
//  Animalable.swift
//  TemplateMethod-Judy
//
//  Created by Judy on 2022/11/08.
//

protocol Animalable {
    // 프로토콜로 구현할 경우 재정의를 막을 수 없음
    func draw() // template method
    func drawHead()
    func drawBody()
    func drawBottom()
}

extension Animalable {
    func draw() {
        drawHead()
        drawBody()
        drawBottom()
    }

    func drawHead() {
        print(" 🙂")
    }

    func drawBody() {
        print("/||\\")
    }

    func drawBottom() {
        print(" /\\\n")
    }
}


//class Animalable {
//    final func draw() {
//        drawHead()
//        drawBody()
//        drawBottom()
//    }
//
//    func drawHead() {
//        print(" 🙂")
//    }
//
//    func drawBody() {
//        print("/||\\")
//    }
//
//    func drawBottom() {
//        print(" /\\")
//    }
//}
