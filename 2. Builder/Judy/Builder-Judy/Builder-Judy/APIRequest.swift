//
//  APIRequest.swift
//  Builder-Judy
//
//  Created by Judy on 2022/10/19.
//

import Foundation

protocol APIRequest {
    var method: HTTPMethod { get }
    var baseURL: String { get }
    var path: String { get }
    var query: [String: Any]? { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
}

extension APIRequest {
    var url: URL? {
        var urlComponents = URLComponents(string: baseURL + path)
        
        if let query = query {
            urlComponents?.queryItems = query.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        return urlComponents?.url
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpBody = body
        urlRequest.httpMethod = method.rawValue
        headers?.forEach { field, value  in
            urlRequest.addValue(value, forHTTPHeaderField: field)
        }
        
        return urlRequest
    }
}
