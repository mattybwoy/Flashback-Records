//
//  NetworkClient.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 05/09/2026.
//

import Foundation

final class NetworkClient: NetworkService {
    
    static let shared = NetworkClient()
    
    let baseURL: URL
    let session: URLSession
    
    init(baseURL: URL = URL(string: "https://api.discogs.com")!,
         session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {

        let (data, response) = try await session.data(for: endpoint.urlRequest(baseURL: baseURL))
        
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw NetworkError.invalidData
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}
