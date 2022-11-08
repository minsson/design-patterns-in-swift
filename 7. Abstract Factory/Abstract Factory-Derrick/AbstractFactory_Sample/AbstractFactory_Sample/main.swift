//
//  main.swift
//  AbstractFactory_Sample
//
//  Created by Derrick kim on 2022/11/08.
//

// Factory Pattern

let blackButton = BlackButton(id: "bb")
let yellowButton = YellowButton(id: "yb")
let blackView = BlackView(id: "bv")
let yellowView = YellowView(id: "yv")

print("\(blackView)\n\(blackButton)\n\(yellowView)\n\(yellowButton)")

// Abstract Factory Pattern
let darkFactory = DarkButtonBoxFactory()

let darkButton = darkFactory.createButton()
let darkView = darkFactory.createView()

print(darkView.id)
print(darkButton.id)
