//
//  DiscogsAPIClient.swift
//  Flashback-Records
//

import Foundation

final class DiscogsAPIClient {

    private let baseURL = "https://api.discogs.com"
    private let userAgent = "FlashbackRecords/1.0 +https://github.com/matthewlock/Flashback-Records"

    func fetchRelease(id: Int) async throws -> DiscogsRelease {
        guard let url = URL(string: "\(baseURL)/releases/\(id)") else {
            throw NetworkError.invalidData
        }

        var request = URLRequest(url: url)
        request.setValue(
            "Discogs key=\(DiscogsSecrets.consumerKey), secret=\(DiscogsSecrets.consumerSecret)",
            forHTTPHeaderField: "Authorization"
        )
        request.setValue(userAgent, forHTTPHeaderField: "User-Agent")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError.noData
        }

        do {
            return try JSONDecoder().decode(DiscogsRelease.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
