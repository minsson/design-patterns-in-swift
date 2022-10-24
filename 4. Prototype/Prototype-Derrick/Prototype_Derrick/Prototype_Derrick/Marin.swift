//
//  Marin.swift
//  Prototype_Derrick
//
//  Created by Derrick kim on 2022/10/24.
// Concrete Prototype 1 

import Foundation

public class Marin: Prototype {
    public var health: Int
    public var attack: Int
    public var defence: Int

    public init(health: Int, attack: Int, defence: Int) {
        self.health = health
        self.attack = attack
        self.defence = defence
    }

    public required convenience init(prototype: Marin) {
        self.init(health: prototype.health,
                  attack: prototype.attack,
                  defence: prototype.defence)
    }
    func printStatus() {
        print("Marin Health: \(health) Attack: \(attack) Defence: \(defence)")
    }

}
