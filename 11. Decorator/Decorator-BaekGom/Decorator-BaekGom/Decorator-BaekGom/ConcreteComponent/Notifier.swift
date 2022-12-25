//
//  Notifier.swift
//  Decorator-BaekGom
//
//

import Foundation

class Notifier: NotifierComponent {
    func notify(message: String) {
        print("\(message) 전송완료")
    }
}
