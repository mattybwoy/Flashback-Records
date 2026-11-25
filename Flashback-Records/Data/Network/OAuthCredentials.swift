//
//  OAuthCredentials.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/11/2026.
//

import Foundation

/// Model for storing OAuth credentials
struct OAuthCredentials: Codable {
    let consumerKey: String
    let consumerSecret: String
    let oauthToken: String
    let oauthTokenSecret: String
    
    var isValid: Bool {
        return !oauthToken.isEmpty && !oauthTokenSecret.isEmpty
    }
}
