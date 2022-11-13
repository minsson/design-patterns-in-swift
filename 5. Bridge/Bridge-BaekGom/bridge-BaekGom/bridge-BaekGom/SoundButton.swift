//
//  SoundButton.swift
//  bridge-BaekGom
//
//  Created by Baek on 2022/11/02.
//

import Foundation

class SoundButton {
    // Bridge
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
    func set(percent: Float) {
        self.soundButtonImplementor?.setVolume(percent: percent)
    }
}
