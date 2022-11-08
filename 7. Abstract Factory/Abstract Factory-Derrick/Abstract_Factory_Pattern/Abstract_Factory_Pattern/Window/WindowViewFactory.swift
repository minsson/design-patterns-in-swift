//
//  WindowViewFactory.swift
//  Abstract_Factory_Pattern
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

class WindowViewFactory: ViewAbstractFactory {
    func createButton() -> Button {
        return WindowButton()
    }

    func createLabel() -> Label {
        return WindowLabel(text: "Window Label")
    }
}
