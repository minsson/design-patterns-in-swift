//
//  YoutubeEx.swift
//  Adapter-wongbing
//
//  Created by 이원빈 on 2022/11/02.
//

import Foundation

protocol Animal {
    func walk()
}

class Dog: Animal {
    func walk() {
        print("강아지 걷는다.")
    }
}

class Cat: Animal {
    func walk() {
        print("고양이 걷는다.")
    }
}

// MARK: - 새로운 클래스 등장 , 기존 인터페이스에 추가하고 싶다 .. !
class Fish {
    func swim() {
        print("물고기 물속을 헤엄친다")
    }
}

// MARK: - FishAdapter 로 래핑하여 같은 인터페이스 채택

class FishAdapter: Animal {
    var animal: Fish
    
    init(animal: Fish) {
        self.animal = animal
    }
    
    func walk() {
        animal.swim()
        // 데이터 변환
    }
}

func move(animal: Animal) {
    animal.walk()
}
