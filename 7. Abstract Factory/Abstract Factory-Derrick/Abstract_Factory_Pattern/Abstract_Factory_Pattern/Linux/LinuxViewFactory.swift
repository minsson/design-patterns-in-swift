//
//  LinuxViewFactory.swift
//  Abstract_Factory_Pattern
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

class LinuxViewFactory: ViewAbstractFactory {
    func createButton() -> Button {
        return LinuxButton()
    }
    func createLabel() -> Label {
        return LinuxLabel(text: "Linux Label")
    }
}


