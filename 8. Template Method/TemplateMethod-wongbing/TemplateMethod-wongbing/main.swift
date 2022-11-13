//
//  main.swift
//  TemplateMethod-wongbing
//
//  Created by 이원빈 on 2022/11/09.
//

// MARK: - Example 구현부
//let concrete1 = ConcreteClass1()
//let concrete2 = ConcreteClass2()
//
//Client.clientCode(use: concrete1)
//print("--------------------------")
//Client.clientCode(use: concrete2)

// MARK: - DataMiner 구현부
let docDataMiner = DocDataMiner()
let csvDataMiner = CSVDataMiner()
let pdfDataMiner = PDFDataMiner()


Client.mineData(with: pdfDataMiner)

