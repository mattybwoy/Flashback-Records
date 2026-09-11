//
//  Endpoint.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 05/09/2026.
//

import Foundation

/// Defines the HTTP method for a network request
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

/// Protocol that defines a type-safe API endpoint
protocol Endpoint {
    /// The path component of the URL (e.g., "/auth/login")
    var path: String { get }
    
    /// The HTTP method to use for this endpoint
    var method: HTTPMethod { get }
    
    /// Optional HTTP headers for the request
    var headers: [String: String]? { get }
    
    /// Optional request body data
    var body: Data? { get }
    
    /// Constructs a complete URLRequest by combining with the base URL
    func urlRequest(baseURL: URL) -> URLRequest
}

// MARK: - Default Implementation
extension Endpoint {
    /// Default implementation that builds a URLRequest
    func urlRequest(baseURL: URL) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }
    
    /// Default: no headers
    var headers: [String: String]? {
        return nil
    }
    
    /// Default: no body
    var body: Data? {
        return nil
    }
}
