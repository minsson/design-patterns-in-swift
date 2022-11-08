//
//  Button.swift
//  AbstractFactory_Sample
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

protocol Button: CustomStringConvertible {
    var id: String { get set }
    var color: String { get set }
}

extension Button {
    var description: String {
        return "[type - button] id: \(id) color \(color)"
    }
}
