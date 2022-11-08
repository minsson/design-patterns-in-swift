//
//  BlackButton.swift
//  AbstractFactory_Sample
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

class BlackButton: Button {
    var id: String
    var color: String = "Black"

    init(id: String) {
        self.id = id
    }
}
