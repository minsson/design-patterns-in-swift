//
//  LightButtonBoxFactory.swift
//  AbstractFactory_Sample
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

class LightButtonBoxFactory: ButtonBoxFactory {
    func createView() -> View {
        return YellowView(id: "yv")
    }

    func createButton() -> Button {
        return BlackButton(id: "bb")
    }
}
