//
//  main.swift
//  Bridge-Judy
//
//  Created by Judy on 2022/11/02.
//

let remote: Remote = BasicRomote(device: Television())

remote.togglePower()
remote.channelUp()
remote.volumDown()
remote.togglePower()

