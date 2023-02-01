//
//  main.swift
//  Visitor-Judy
//
//  Created by Judy on 2023/01/18.
//

// Client
let dicountVisitor = DiscountVisitor()
let pointVisitor = PointVisitor()

let goldMembership = Gold()
let silverMembership = Silver()
let bronzeMembership = Bronze()


goldMembership.accept(dicountVisitor)
silverMembership.accept(dicountVisitor)
bronzeMembership.accept(dicountVisitor)

goldMembership.accept(pointVisitor)
silverMembership.accept(pointVisitor)
bronzeMembership.accept(pointVisitor)
