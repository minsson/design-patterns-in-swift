//
//  DataMining.swift
//  template-method-BaekGom
//
//  Created by Baek on 2022/11/09.
//

import Foundation

class DataMining {
    final func dataMining() {
        getData()
        dataProcess()
        dataAnalysis()
    }
    
    func getData() {
        print("데이터를 불러옵니다.")
    }
    
    func dataProcess() {
        print("데이터 처리완료")
    }
    
    func dataAnalysis() {
        print("데이터 분석완료\n")
    }
}
