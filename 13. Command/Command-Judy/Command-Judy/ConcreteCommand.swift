//
//  ConcreteCommand.swift
//  Command-Judy
//
//  Created by Judy on 2022/12/07.
//

import UIKit

final class TitleCommand: Command {
    private let receiver: Receiver
    private var prevNumber: [Int] = []
    private var number = 0
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        number = Int.random(in: 0...100)
        prevNumber.append(number)
        receiver.changeTitle("타이틀 커맨드: \(number)")
    }
    
    func unexecute() {
        receiver.changeTitle("타이틀 커맨드: \(prevNumber.popLast()!)")
    }
}

final class ColorCommand: Command {
    private let receiver: UIButton
    private var prevColor: [UIColor] = []
    private var color = UIColor.systemBlue
    
    init(receiver: UIButton) {
        self.receiver = receiver
    }
    
    func execute() {
        let redValue = CGFloat.random(in: 0...1)
        let greenValue = CGFloat.random(in: 0...1)
        let blueValue = CGFloat.random(in: 0...1)
        color = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        prevColor.append(color)
        receiver.backgroundColor = color
    }
    
    func unexecute() {
        receiver.backgroundColor = prevColor.popLast()!
    }
}
