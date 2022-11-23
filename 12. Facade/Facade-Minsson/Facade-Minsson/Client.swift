//
//  Client.swift
//  Facade-Minsson
//
//  Created by minsson on 2022/11/23.
//

struct Client { // TV로 영화를 보고 싶다.
    private let blind = Blind()
    private let light = Light()
    private let tv = TV()
    private let appleTVsoftware = AppleTVSoftware()
    
    func turnOnMovieMode() {
        blind.rollDown()
        light.turnOff()
        tv.turnOn()
        appleTVsoftware.findMovie()
        appleTVsoftware.showMoive()
    }
    
    func turnOffMovieMode() {
        blind.rollUp()
        light.turnOn()
        tv.turnOff()
    }
}

struct ClientWithFacade {
    let siri = SiriFacade()
}
