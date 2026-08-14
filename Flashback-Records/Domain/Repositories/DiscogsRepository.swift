//
//  DiscogsRepository.swift
//  Flashback-Records
//

protocol DiscogsRepository {
    func fetchRelease(id: Int) async throws -> DiscogsRelease
}
