//
//  RadioSoundButton.swift
//  bridge-BaekGom
//
//  Created by Baek on 2022/11/02.
//

import Foundation

class RadioSoundButton: SoundButtonImplementor {
    var volume: Float = 0
    func volumeUp() {
        if volume >= 1.0 {
            print("Radio 볼륨이 최대값입니다.")
        } else {
            volume = min(volume + 0.1, 1.0)
            print("Radio 볼륨 \(volume)으로 올림")
        }
    }
    
    func volumeDown() {
        if volume <= 0.0 {
            print("Radio 볼륨이 최저값입니다.")
        } else {
            volume = max(volume - 0.1, 0.0)
            print("Radio 볼륨 \(volume)으로 내림")
        }
    }
    func setVolume(percent: Float) {
        if percent < 0.0 || percent > 1.0 {
            print("잘못된 Radio 볼륨 값")
        } else {
            volume = percent
            print("Radio 볼륨 \(volume)으로 세팅")
        }
    }
}
