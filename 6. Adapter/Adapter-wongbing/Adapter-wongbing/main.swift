//
//  main.swift
//  Adapter-wongbing
//
//  Created by 이원빈 on 2022/11/02.
//
// MARK: - Refactoring Guru 예시
//let refactoringGuruExample = AdapterConceptual()
//refactoringGuruExample.testAdapterConceptual()

// MARK: - 동물 예시
let dog = Dog()
let cat = Cat()
let fish = Fish()
let fishAdapter = FishAdapter(animal: fish) // fish는 그냥사용할 수 없고 Adapter를 통해 같은 인터페이스로 만들어준다.

move(animal: dog)
move(animal: cat)
move(animal: fishAdapter) // 그럼 move라는 메서드에 파라미터로 사용할 수 있게 된다.

