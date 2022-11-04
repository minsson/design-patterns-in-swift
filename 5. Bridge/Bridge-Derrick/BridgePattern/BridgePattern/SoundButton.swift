//
//  SoundButton.swift
//  BridgePattern
//
//  Created by Derrick kim on 2022/11/01.
//

import Foundation

// MARK: Abstraction

class SoundButton {
    // Bridge Instance
    var soundButtonImplementor: SoundButtonImplementor?

    init(implementor: SoundButtonImplementor) {
        self.soundButtonImplementor = implementor
    }

    func up() {
        self.soundButtonImplementor?.volumeUp()
    }

    func down() {
        self.soundButtonImplementor?.volumeDown()
    }

    func set(_ percent: Float) {
        self.soundButtonImplementor?.setVolume(percent: percent)
    }
}

extension SoundButton {
    func mute() {
        self.soundButtonImplementor?.setVolume(percent: 0.0)
    }
}
