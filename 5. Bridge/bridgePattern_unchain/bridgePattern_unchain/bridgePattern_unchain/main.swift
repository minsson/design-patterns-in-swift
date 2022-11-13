//
//  main.swift
//  bridgePattern_unchain
//
//  Created by 오경식 on 2022/11/01.
//

import Foundation

//MARK: Abstraction
class ColorChanger {
    var colorChangerImplementor: Shape?

    init(implementor: Shape) {
        self.colorChangerImplementor = implementor
    }

    func change(changed: String) {
        self.colorChangerImplementor?.changeColor(changedColor: changed)
    }
}
//MARK: Implementor
protocol Shape {
    var color: String { get set }
    func changeColor(changedColor: String)
}
//MARK: ConcreteImplementor
class Circle: Shape {
    var color: String = "빨간색"

    func changeColor(changedColor: String) {
        color = changedColor
        print("\(changedColor) 원형 모양 생성")
    }
}
//MARK: RefineAbstraction
extension ColorChanger {
    func removeColor() {
        self.colorChangerImplementor?.changeColor(changedColor: "")
    }
}

let abcd = Circle()
let changer = ColorChanger(implementor: abcd)
changer.change(changed: "파란색")
changer.removeColor()
