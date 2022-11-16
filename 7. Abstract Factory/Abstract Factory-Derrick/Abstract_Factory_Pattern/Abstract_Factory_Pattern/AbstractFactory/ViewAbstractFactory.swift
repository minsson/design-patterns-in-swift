//
//  ViewAbstractFactory.swift
//  Abstract_Factory_Pattern
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

protocol ViewAbstractFactory {
    func createButton() -> Button
    func createLabel() -> Label
}
