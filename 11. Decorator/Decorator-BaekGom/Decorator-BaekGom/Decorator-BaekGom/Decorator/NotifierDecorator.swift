//
//  NotifierDecorator.swift
//  Decorator-BaekGom
//
//

import Foundation

protocol NotifierDecorator: NotifierComponent {
    var wrappee: NotifierComponent { get set }
    init(notifier: NotifierComponent)
}
