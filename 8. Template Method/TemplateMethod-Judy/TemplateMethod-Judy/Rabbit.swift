//
//  Rabit.swift
//  TemplateMethod-Judy
//
//  Created by Judy on 2022/11/08.
//

class Human: Animalable {
    
}

class Rabbit: Animalable {
    func drawHead() {
        print(" 🐰")
    }
}

class MuscleRabbit: Animalable {
    func drawHead() {
        print("  🐰")
    }
    
    func drawBody() {
        print("💪🏻||\\")
    }
    
    func drawBottom() {
        print("  /\\\n")
    }
}
