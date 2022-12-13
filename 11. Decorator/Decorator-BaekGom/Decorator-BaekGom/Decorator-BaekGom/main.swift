//
//  main.swift
//  Decorator-BaekGom
//
//

import Foundation

let notifier = Notifier()
let emailNotifier = EmailDecorator(notifier: notifier)
let slackNotifier = SlackDecorator(notifier: emailNotifier)
slackNotifier.notify(message: "Hello")

