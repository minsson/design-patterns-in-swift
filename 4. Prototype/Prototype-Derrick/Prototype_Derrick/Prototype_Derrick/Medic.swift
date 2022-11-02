//
//  Medic.swift
//  Prototype_Derrick
//
//  Created by Derrick kim on 2022/10/24.
// Concrete Prototype

import Foundation

public class Medic: Prototype {
    public var health: Int
    public var mana: Int
    public var defence: Int

    public init(health: Int, mana: Int, defence: Int) {
        self.health = health
        self.mana = mana
        self.defence = defence
    }

    public required convenience init(prototype: Medic) {
        self.init(health: prototype.health,
                                    mana: prototype.mana,
                                    defence: prototype.defence)
    }

    func printStatus() {
        print("Medic Health: \(health) Mana: \(mana) Defence: \(defence)")
    }
}
