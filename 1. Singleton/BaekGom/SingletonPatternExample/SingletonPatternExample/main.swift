//
//  main.swift
//  SingletonPatternExample
//
//  Created by Baek on 2022/10/18.
//

import Foundation

class YagomAcademyMember {
    static let shared = YagomAcademyMember()
    
    var nickName: String?
    var cardinalNumber: String?
    var role: String?
    
    private init() {}
}

//Controller A
let yagomMemberA = YagomAcademyMember.shared
yagomMemberA.nickName = "BaekGom"
// nickName = "BaekGom"
// cardinalNumber = nil
// role = nil
print("Controller A")
print(yagomMemberA.nickName)
print(yagomMemberA.cardinalNumber)
print(yagomMemberA.role)
print("")
let yagomMemberB = YagomAcademyMember.shared
yagomMemberB.cardinalNumber = "6기"
// nickName = "BaekGom"
// cardinalNumber = "6기"
// role = nil
print("Controller B")
print(yagomMemberA.nickName)
print(yagomMemberA.cardinalNumber)
print(yagomMemberA.role)
print("")
let yagomMemberC = YagomAcademyMember.shared
yagomMemberC.role = "Camper"
// nickName = "BaekGom"
// cardinalNumber = "6기"
// role = "Camper"
print("Controller C")
print(yagomMemberC.nickName)
print(yagomMemberC.cardinalNumber)
print(yagomMemberC.role)
print("")

let yagomMemberD = YagomAcademyMember.shared
print("Controller D")
print(yagomMemberD.nickName)
print(yagomMemberD.cardinalNumber)
print(yagomMemberD.role)
