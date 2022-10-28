//
//  Human.swift
//  Prototype-Kiwi
//
//  Created by Kiwon Song on 2022/10/26.
//

class Human: Prototype {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    required convenience init(prototype: Human) {
        self.init(name: prototype.name,
                  age: prototype.age)
    }
    
    func printStatus() {
        print("이름은 \(name)이며 나이는 \(age)세 입니다.")
    }
}

