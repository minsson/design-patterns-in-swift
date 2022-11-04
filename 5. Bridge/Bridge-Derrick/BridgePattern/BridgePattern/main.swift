//
//  main.swift
//  BridgePattern
//
//  Created by Derrick kim on 2022/11/01.
//

import Foundation

let tvSoundButton = TvSoundButton()
let soundButton = SoundButton(implementor: tvSoundButton)
soundButton.down()

let radioSoundButton = RadioSoundButton()
soundButton.soundButtonImplementor = radioSoundButton
soundButton.set(0.5)

soundButton.mute()
