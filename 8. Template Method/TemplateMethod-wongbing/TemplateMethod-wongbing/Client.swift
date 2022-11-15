//
//  Client.swift
//  TemplateMethod-wongbing
//
//  Created by 이원빈 on 2022/11/09.
//

class Client {
    static func clientCode(use object: AbstractProtocol) {
        object.templateMethod()
    }
    
    static func mineData(with miner: DataMiner) {
        miner.mine()
    }
}
