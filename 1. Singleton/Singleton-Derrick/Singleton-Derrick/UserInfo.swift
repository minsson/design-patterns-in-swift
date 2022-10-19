//
//  UserInfo.swift
//  Singleton-Derrick
//
//  Created by Derrick kim on 2022/10/18.
//

import Foundation

class UserInfo {
    static let shared = UserInfo()

    var id: String?
    var password: String?
    var name: String?

    private init() { }
}
