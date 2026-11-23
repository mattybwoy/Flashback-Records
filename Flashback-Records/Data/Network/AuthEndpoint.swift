//
//  AuthEndpoint.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 05/09/2026.
//

import Foundation

/// Endpoints for authentication-related API calls
enum AuthEndpoint: Endpoint {
    case requestToken(callbackURL: String)
    case accessToken(token: String, verifier: String)
    case logout
    case identity
    
    var path: String {
        switch self {
        case .requestToken:
            return "/oauth/request_token"
        case .accessToken:
            return "/oauth/access_token"
        case .logout:
            return "/oauth/logout"
        case .identity:
            return "/oauth/identity"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .requestToken:
            return .get
        case .accessToken:
            return .post
        case .logout:
            return .post
        case .identity:
            return .get
        }
    }
    
    var headers: [String: String]? {
        // OAuth headers will be added by the NetworkClient/OAuthService
        // based on the consumer key, token, and signature
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }
    
    var body: Data? {
        switch self {
        case .requestToken(let callbackURL):
            // OAuth callback is typically sent as a query parameter, not body
            // For Discogs, this may be included in the OAuth signature
            // Leaving body as nil for GET request
            return nil
            
        case .accessToken(let token, let verifier):
            // Token and verifier for OAuth access token exchange
            let bodyString = "oauth_token=\(token)&oauth_verifier=\(verifier)"
            return bodyString.data(using: .utf8)
            
        case .identity, .logout:
            return nil
        }
    }
}
