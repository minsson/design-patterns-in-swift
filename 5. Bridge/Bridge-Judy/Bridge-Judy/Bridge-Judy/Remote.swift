//
//  Remote.swift
//  Bridge-Judy
//
//  Created by Judy on 2022/11/02.
//

protocol Remote {
    var device: Device { get set }
    func togglePower()
    func volumUp()
    func volumDown()
    func channelUp()
    func channelDown()
}

class BasicRomote: Remote {
    var device: Device
    
    init(device: Device) {
        self.device = device
    }
    
    func togglePower() {
        if device.isOn {
            device.turnOn()
        } else {
            device.turnOff()
        }
    }
    
    func volumUp() {
        device.setVolume(degree: device.volume + 1)
    }
    
    func volumDown() {
        device.setVolume(degree: device.volume - 1)
    }
    
    func channelUp() {
        device.setChannel(to: device.channel + 1)
    }
    
    func channelDown() {
        device.setChannel(to: device.channel + 1)
    }
}
