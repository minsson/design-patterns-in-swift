//
//  RequestDirector.swift
//  Builder-Judy
//
//  Created by Judy on 2022/10/19.
//

import Foundation

struct RequestDirector {
    private let builder: RequestBuilder
    
    init(_ builder: RequestBuilder = RequestBuilder()) {
        self.builder = builder
    }
    
    func createGetRequest() -> MarketRequest? {
        let getRequest = builder.setMethod(.get)
            .setPath(URLPath.product.rawValue)
            .setQuery([Query.page: 1, Query.itemPerPage: 100])
            .buildRequest()
        
        return getRequest
    }
    
    func createGetDetailRequest(_ productNumber: Int) -> MarketRequest? {
        let getDetailRequest = builder.setMethod(.get)
            .setPath(URLPath.product.rawValue + "/\(productNumber)")
            .buildRequest()
        
        return getDetailRequest
    }
    
    func createPostRequest(with dataElement: [[String : Any]]) -> MarketRequest? {
        let boundary = "Boundary-\(UUID().uuidString)"
        let postRequest = builder.setMethod(.post)
            .setPath(URLPath.product.rawValue)
            .setBody(MultipartBodyManager().makeBody(parameters: dataElement, boundary))
            .setHeaders(["Content-Type": "multipart/form-data; boundary=\(boundary)",
                         "identifier": "Vendor_Identifier"])
            .buildRequest()

        return postRequest
    }
    
    func createPatchRequest(productNumber: Int, dataElement: String) -> MarketRequest? {
        guard let postData = dataElement.data(using: .utf8) else { return nil }
        
        let patchRequest = builder.setMethod(.patch)
            .setPath(URLPath.product.rawValue + "\(productNumber)")
            .setHeaders(["identifier": "Vendor_Identifier"])
            .setBody(postData)
            .buildRequest()
        
        return patchRequest
    }
    
    func createDeleteURIRequest(vendorSecret: String, productNumber: Int) -> MarketRequest? {
        let parameters = "{\"secret\": \"\(vendorSecret)\"}"
        guard let postData = parameters.data(using: .utf8) else { return nil }
        
        let deleteURIRequest = builder.setMethod(.post)
            .setPath(URLPath.product.rawValue + "/\(productNumber)/archived")
            .setHeaders(["Content-Type": "application/json",
                         "identifier": "Vendor_Identifier"])
            .setBody(postData)
            .buildRequest()
        
        return deleteURIRequest
    }
    
    func createDeleteRequest(with deleteURI: Data) -> MarketRequest? {
        guard let deleteKey = String(data: deleteURI, encoding: .utf8) else { return nil }
        
        let deleteRequest = builder.setMethod(.delete)
            .setPath(deleteKey)
            .setHeaders(["identifier": "Vendor_Identifier"])
            .buildRequest()
        
        return deleteRequest
    }
}

struct MultipartBodyManager {
    func makeBody(parameters: [[String : Any]], _ boundary: String) -> Data? {
        let body = Data()
        
        // body 만드는 코드

        return body
    }
}
