//
//  MacViewFactory.swift
//  Abstract_Factory_Pattern
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation
// Mac
class MacViewFactory: ViewAbstractFactory {
    func createButton() -> Button {
        return MacButton()
    }

    func createLabel() -> Label {
        return MacLabel(text: "Mac Label")
    }
}

