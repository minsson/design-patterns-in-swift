//
//  main.swift
//  Builder-Kiwi
//
//  Created by Kiwon Song on 2022/10/19.
//

let builder = iPhoneBuilder()

// without Director
var iphone1 = builder.build()

// 기본값
iphone1.getAllProperty()

// iPhone ProMax
builder.setScreen(.proMax)
builder.setSpeaker(.sony)
builder.addButton(.cristal)
builder.addButton(.plastic)
builder.addButton(.iron)
builder.setFrame(.proMax)
iphone1 = builder.build()
iphone1.getAllProperty()

//with Director

let director = iPhoneDirector()

var iphone2 = director.createiPhoneMini()

iphone2.getAllProperty()
