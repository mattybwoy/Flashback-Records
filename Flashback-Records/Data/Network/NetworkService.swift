//
//  NetworkService.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 05/09/2026.
//

import Foundation

protocol NetworkService {
    var baseURL: URL { get }
    var session: URLSession { get }
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}
