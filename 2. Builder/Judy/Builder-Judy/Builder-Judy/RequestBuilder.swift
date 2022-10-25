//
//  RequestBuilder.swift
//  Builder-Judy
//
//  Created by Judy on 2022/10/19.
//

import Foundation

struct MarketRequest: APIRequest {
    var method: HTTPMethod
    var baseURL: String
    var path: String
    var query: [String: Any]?
    var body: Data?
    var headers: [String: String]?
}

final class RequestBuilder {
    private var baseURL: String
    private var method: HTTPMethod?
    private var path: String?
    private var query: [String: Any]?
    private var body: Data?
    private var headers: [String: String]?
    
    init() {
        self.baseURL = URLHost.url
    }
    
    func setBaseURL(_ url: String) -> RequestBuilder  {
        self.baseURL = url
        return self
    }
    
    func setMethod(_ method: HTTPMethod) -> RequestBuilder {
        self.method = method
        return self
    }
    
    func setPath(_ path: String) -> RequestBuilder {
        self.path = path
        return self
    }
    
    func setQuery(_ query: [String: Any]) -> RequestBuilder {
        self.query = query
        return self
    }
    
    func setBody(_ body: Data?) -> RequestBuilder {
        self.body = body
        return self
    }
    
    func setHeaders(_ headers: [String: String]) -> RequestBuilder {
        self.headers = headers
        return self
    }
    
    func buildRequest() -> MarketRequest? {
        guard let method = method, let path = path else {
            return nil
        }

        let marketRequest = MarketRequest(method: method,
                                          baseURL: baseURL,
                                          path: path,
                                          query: query,
                                          body: body,
                                          headers: headers)
        return marketRequest
    }
}
