//
//  iPhoneDirector.swift
//  Builder-Kiwi
//
//  Created by Kiwon Song on 2022/10/19.
//

class iPhoneDirector {
    public func createiPhoneMini() -> iPhone {
        let builder = iPhoneBuilder()
        builder.setScreen(.mini)
        builder.setSpeaker(.jbl)
        builder.addButton(.cristal)
        builder.addButton(.plastic)
        builder.setFrame(.mini)
        return builder.build()
    }
    public func createiPhonePro() -> iPhone {
        let builder = iPhoneBuilder()
        builder.setScreen(.pro)
        builder.setSpeaker(.bose)
        builder.addButton(.cristal)
        builder.addButton(.plastic)
        builder.addButton(.iron)
        builder.setFrame(.pro)
        return builder.build()
    }
}

