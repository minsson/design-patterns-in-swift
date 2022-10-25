//
//  main.swift
//  Builder-Judy
//
//  Created by Judy on 2022/10/19.
//

import Foundation

let getRequest = RequestDirector().createGetRequest()!

dataTask(request: getRequest) { result in
    switch result {
    case .success(let data):
        print(data)
        print("데이터를 받아왔습니다.")
    case .failure(_):
        print("데이터를 받아오지 못했습니다.")
    }
}

func dataTask(request: APIRequest, completionHandler: @escaping (Result<Data, Error>) -> Void) {
    // task 코드
}
