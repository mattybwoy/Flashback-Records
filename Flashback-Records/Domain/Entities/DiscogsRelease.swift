//
//  DiscogsRelease.swift
//  Flashback-Records
//

struct DiscogsRelease: Decodable {
    let id: Int
    let title: String
    let images: [DiscogsImage]?
}

struct DiscogsImage: Decodable {
    let type: String
    let uri: String
    let resourceUrl: String
    let uri150: String
    let width: Int
    let height: Int

    enum CodingKeys: String, CodingKey {
        case type
        case uri
        case resourceUrl = "resource_url"
        case uri150
        case width
        case height
    }
}
