//
//  Singleton.swift
//  SingletonParttern
//
//  Created by 오경식 on 2022/10/18.
//

import Foundation

class Singleton {
    static let shared = Singleton()

    private init() {}

    var definition = ""
    var whyUse = ""
    var advantage = ""
    var disAdvantage = ""

    func showAll() -> String {
        return """
        정의 : \(definition)
        이유 : \(whyUse)
        장점 : \(advantage)
        단점 : \(disAdvantage)
        """
    }
}
