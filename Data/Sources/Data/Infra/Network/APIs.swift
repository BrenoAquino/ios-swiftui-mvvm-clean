//
//  APIs.swift
//  
//
//  Created by Breno Aquino on 20/01/22.
//

import Foundation
import Domain

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

public protocol APIs {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    
    var queryParams: [String: Any]? { get }
    var body: Data? { get }
}

extension APIs {
    func createRequest() throws -> URLRequest {
        guard var components = URLComponents(string: baseURL + "/" + path) else {
            throw CharlesDataError(type: .invalidURL)
        }
        
        if let queryParams = queryParams {
            components.queryItems = []
            for (key, value) in queryParams {
                components.queryItems?.append(
                    .init(name: key, value: String(describing: value))
                )
            }
        }
        
        guard let url = components.url else {
            throw CharlesDataError(type: .invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        return request
    }
}
