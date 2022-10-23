//
//  Namespace.swift
//  Builder-Judy
//
//  Created by Judy on 2022/10/19.
//

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum URLHost {
    static let url = "https://openmarket.yagom-academy.kr"
}

enum URLPath: String {
    case healthChecker = "/healthChecker"
    case product = "/api/products"
}

enum Query {
    static let page = "page_no"
    static let itemPerPage = "items_per_page"
}
