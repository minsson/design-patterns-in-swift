//
//  SoundButtonImplementor.swift
//  bridge-BaekGom
//
//  Created by Baek on 2022/11/02.
//

import Foundation

protocol SoundButtonImplementor {
    var volume: Float { get set }
    func volumeUp()
    func volumeDown()
    func setVolume(percent: Float)
}
