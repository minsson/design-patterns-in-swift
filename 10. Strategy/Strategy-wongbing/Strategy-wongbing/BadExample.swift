//
//  BadExample.swift
//  Strategy-wongbing
//
//  Created by 이원빈 on 2022/11/16.
//

class Context2 {
    
    func useBus(from a: String, to b: String) {
        print("\(a)에서 가까운 버스정류장을 찾는다")
        print("버스를 타고 \(b)로 이동")
    }
    
    func useTaxi(from a: String, to b: String) {
        print("택시를 \(a)로 부른다")
        print("택시를 타고 \(b)로 이동")
    }
    
    func useAirplane(from a: String, to b: String) {
        print("\(a) 에서 가까운 공항을 찾아 간다")
        print("비행기를 타고 \(b)로 이동")
    }
    
    // Bad! : 알고리즘이 추가될 때마다 함수가 늘어나 Class 가 방대해질 것이다.
}
