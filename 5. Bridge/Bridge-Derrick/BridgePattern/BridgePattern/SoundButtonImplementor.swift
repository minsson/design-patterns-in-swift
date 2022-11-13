//
//  SoundButtonImplementor.swift
//  BridgePattern
//
//  Created by Derrick kim on 2022/11/01.
//

// MARK: Implementor

protocol SoundButtonImplementor {
    var volume: Float { get set }
    func volumeUp()
    func volumeDown()
    func setVolume(percent: Float)
}
