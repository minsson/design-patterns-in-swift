//
//  main.swift
//  Prototype-BaekGom
//
//  Created by Baek on 2022/10/25.
//

import Foundation

public protocol Prototype: AnyObject {
    init(prototype: Self)
}

extension Prototype {
    public func clone() -> Self {
        return type(of: self).init(prototype: self)
    }
}

public class iPhone: Prototype {
    public var cpu: String
    public var ram: Int
    public var display: String
    
    public init(cpu: String, ram: Int, display: String) {
        self.cpu = cpu
        self.ram = ram
        self.display = display
    }
    
    public required convenience init(prototype: iPhone) {
        self.init(cpu: prototype.cpu, ram: prototype.ram, display: prototype.display)
    }
    
    func specification() {
        print("iPhone Spec CPU: \(cpu) RAM: \(ram)GB Display: \(display)")
    }
}

let iPhone1 = iPhone(cpu: "M1", ram: 8, display: "12inch")

//print("Original")
//iPhone1.specification()
//
//let iPhone1Clone = iPhone1.clone()
//
//print("Clone")
//iPhone1Clone.specification()

var iPhone2 = iPhone(cpu: "M2", ram: 16, display: "13inch")
var shallCopyiPhone2 = iPhone2
var deepCopyiPhone2 = iPhone2.clone()

shallCopyiPhone2.ram += 8
deepCopyiPhone2.ram += 16

iPhone2.specification()
deepCopyiPhone2.specification()

