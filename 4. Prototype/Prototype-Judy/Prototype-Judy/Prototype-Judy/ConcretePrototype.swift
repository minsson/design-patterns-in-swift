//
//  ConcretePrototype.swift
//  Prototype-Judy
//
//  Created by Judy on 2022/10/26.
//

import UIKit

class AAA: Prototype {
    var aaa: String
    var bbb: String
    var ccc: String
    
    init(aaa: String, bbb: String, ccc: String) {
        self.aaa = aaa
        self.bbb = bbb
        self.ccc = ccc
    }
    
    required convenience init(_ type: AAA) {
        self.init(aaa: type.aaa, bbb: type.bbb, ccc: type.ccc)
    }
}

class Cell: Prototype {
    var image: UIImageView
    var name: String
    var color: UIColor
    
    init(image: UIImage, name: String, color: UIColor) {
        self.image = UIImageView(image: image)
        self.name = name
        self.color = color
        self.image.backgroundColor = color
    }
    
    required convenience init(_ type: Cell) {
        self.init(image: type.image.image!, name: type.name, color: type.color)
    }
}
