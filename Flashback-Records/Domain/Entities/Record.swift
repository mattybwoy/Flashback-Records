//
//  Record.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/08/2026.
//

struct Record: Equatable, Hashable {
    let artist: String
    let title: String
    let year: Int
    let format: Format
    let price: Int
    let condition: Condition
    
    enum Format {
        case vinyl
        case cd
    }
    
    enum Condition {
        case new
    }
}

