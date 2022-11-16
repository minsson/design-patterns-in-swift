//
//  View.swift
//  AbstractFactory_Sample
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

protocol View: CustomStringConvertible {
    var id: String { get set }
    var color: String { get set }
}

extension View {
    var description: String {
        return "[type - view] id: \(id) color \(color)"
    }
}
