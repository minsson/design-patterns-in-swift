//
//  main.swift
//  Abstract_Factory_Pattern
//
//  Created by Derrick kim on 2022/11/08.
//

import Foundation

let macFactory = MacViewFactory()

let macButton = macFactory.createButton()
let macLabel = macFactory.createLabel()

macButton.click()
print(macLabel.text)


