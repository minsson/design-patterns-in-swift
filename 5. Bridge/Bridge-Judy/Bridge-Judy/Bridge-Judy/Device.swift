//
//  Device.swift
//  Bridge-Judy
//
//  Created by Judy on 2022/11/02.
//

protocol Device {
    var isOn: Bool { get set }
    var channel: Int { get set }
    var volume: Int { get set }
    func turnOn()
    func turnOff()
    func setChannel(to channel: Int)
    func setVolume(degree: Int)
}

class Radio: Device {
    var isOn: Bool = false
    var channel: Int = 999
    var volume: Int = 7
    
    func turnOff() {
        self.isOn = false
        print("라디오의 전원을 껐습니다.")
    }
    
    func turnOn() {
        self.isOn = true
        print("라디오의 전원을 켰습니다.")
    }
    
    func setChannel(to channel: Int) {
        self.channel = channel
        print("주파수를 \(channel)번으로 변경했습니다.")
    }
    
    func setVolume(degree: Int) {
        self.volume = degree
        print("볼륨을 \(degree)로 변경했습니다.")
    }
}


class Television: Device {
    var isOn: Bool = false
    var channel: Int = 5
    var volume: Int = 15
    
    func turnOff() {
        self.isOn = false
        print("TV의 전원을 껐습니다.")
    }
    
    func turnOn() {
        self.isOn = true
        print("TV의 전원을 켰습니다.")
    }
    
    func setChannel(to channel: Int) {
        self.channel = channel
        print("채널을 \(channel)번으로 변경했습니다.")
    }
    
    func setVolume(degree: Int) {
        self.volume = degree
        print("볼륨을 \(degree)로 변경했습니다.")
    }
}
