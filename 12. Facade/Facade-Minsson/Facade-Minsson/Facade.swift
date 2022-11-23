//
//  Facade.swift
//  Facade-Minsson
//
//  Created by minsson on 2022/11/23.
//

struct SiriFacade {
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
