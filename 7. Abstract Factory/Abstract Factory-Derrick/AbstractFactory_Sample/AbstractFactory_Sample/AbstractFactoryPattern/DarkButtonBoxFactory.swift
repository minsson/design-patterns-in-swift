//
//  DarkButtonBoxFactory.swift
//  AbstractFactory_Sample
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

class DarkButtonBoxFactory: ButtonBoxFactory {
    func createView() -> View {
        return BlackView(id: "bv")
    }

    func createButton() -> Button {
        return YellowButton(id: "yb")
    }
}
