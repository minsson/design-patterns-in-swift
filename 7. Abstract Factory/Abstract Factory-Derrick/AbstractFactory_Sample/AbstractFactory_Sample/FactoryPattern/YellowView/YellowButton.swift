//
//  YellowButton.swift
//  AbstractFactory_Sample
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

class YellowButton: Button {
    var id: String
    var color: String = "Yellow"

    init(id: String) {
        self.id = id
    }
}
