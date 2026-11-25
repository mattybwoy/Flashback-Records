//
//  OAuthService.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 23/11/2026.
//

import Foundation
import OAuthSwift

/// Service for handling Discogs OAuth 1.0a authentication
final class OAuthService {
    
    // MARK: - Properties
    
    private let consumerKey: String
    private let consumerSecret: String
    private let callbackURL: String
    
    private var oauthSwift: OAuth1Swift?
    
    // MARK: - Discogs OAuth URLs
    
    private let requestTokenURL = "https://api.discogs.com/oauth/request_token"
    private let authorizeURL = "https://www.discogs.com/oauth/authorize"
    private let accessTokenURL = "https://api.discogs.com/oauth/access_token"
    
    // MARK: - Initialization
    
    init(consumerKey: String, consumerSecret: String, callbackURL: String = "flashbackrecords://oauth-callback") {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
        self.callbackURL = callbackURL
    }
    
    // MARK: - OAuth Flow Methods
    
    /// Starts the OAuth authorization flow
    /// - Returns: OAuth credentials containing access token and token secret
    func authorize() async throws -> OAuthCredentials {
        return try await withCheckedThrowingContinuation { continuation in
            // Initialize OAuth1Swift with Discogs endpoints
            let oauthSwift = OAuth1Swift(
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                requestTokenUrl: requestTokenURL,
                authorizeUrl: authorizeURL,
                accessTokenUrl: accessTokenURL
            )
            
            self.oauthSwift = oauthSwift
            
            // Start the authorization flow using Result-based API
            _ = oauthSwift.authorize(withCallbackURL: callbackURL) { result in
                switch result {
                case .success(let (credential, _, _)):
                    let oauthCredentials = OAuthCredentials(
                        consumerKey: self.consumerKey,
                        consumerSecret: self.consumerSecret,
                        oauthToken: credential.oauthToken,
                        oauthTokenSecret: credential.oauthTokenSecret
                    )
                    continuation.resume(returning: oauthCredentials)
                    
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    /// Make an authenticated API request using OAuth credentials
    /// - Parameters:
    ///   - url: The URL for the API request
    ///   - method: HTTP method (GET, POST, etc.)
    ///   - credentials: OAuth credentials with access token
    ///   - parameters: Optional query parameters
    /// - Returns: Response data
    func makeAuthenticatedRequest(
        url: URL,
        method: OAuthSwiftHTTPRequest.Method,
        credentials: OAuthCredentials,
        parameters: [String: Any] = [:],
        headers: [String: String] = [:]
    ) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            let oauthSwift = OAuth1Swift(
                consumerKey: credentials.consumerKey,
                consumerSecret: credentials.consumerSecret,
                requestTokenUrl: requestTokenURL,
                authorizeUrl: authorizeURL,
                accessTokenUrl: accessTokenURL
            )
            
            // Set the access token credentials
            oauthSwift.client.credential.oauthToken = credentials.oauthToken
            oauthSwift.client.credential.oauthTokenSecret = credentials.oauthTokenSecret
            
            // Make the authenticated request
            _ = oauthSwift.client.request(
                url,
                method: method,
                parameters: parameters,
                headers: headers
            ) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response.data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    /// Get the OAuth client configured with credentials for manual requests
    /// Use this if you need to integrate with your existing NetworkClient
    func getConfiguredClient(credentials: OAuthCredentials) -> OAuth1Swift {
        let oauthSwift = OAuth1Swift(
            consumerKey: credentials.consumerKey,
            consumerSecret: credentials.consumerSecret,
            requestTokenUrl: requestTokenURL,
            authorizeUrl: authorizeURL,
            accessTokenUrl: accessTokenURL
        )
        
        oauthSwift.client.credential.oauthToken = credentials.oauthToken
        oauthSwift.client.credential.oauthTokenSecret = credentials.oauthTokenSecret
        
        return oauthSwift
    }
    
    /// Handle OAuth callback URL
    /// - Parameter url: The callback URL received from the OAuth provider
    func handleCallback(url: URL) {
        OAuth1Swift.handle(url: url)
    }
}

// MARK: - OAuth Error

enum OAuthError: LocalizedError {
    case authorizationFailed
    case missingCredentials
    case invalidCallback
    
    var errorDescription: String? {
        switch self {
        case .authorizationFailed:
            return "Failed to authorize with Discogs"
        case .missingCredentials:
            return "OAuth credentials are missing"
        case .invalidCallback:
            return "Invalid OAuth callback URL"
        }
    }
}

