//
//  DiscogsRepositoryImpl.swift
//  Flashback-Records
//

final class DiscogsRepositoryImpl: DiscogsRepository {

    private let client: DiscogsAPIClient

    init(client: DiscogsAPIClient = DiscogsAPIClient()) {
        self.client = client
    }

    func fetchRelease(id: Int) async throws -> DiscogsRelease {
        try await client.fetchRelease(id: id)
    }
}
