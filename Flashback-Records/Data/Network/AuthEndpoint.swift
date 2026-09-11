//
//  AuthEndpoint.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 05/09/2026.
//

import Foundation

/// Endpoints for authentication-related API calls
enum AuthEndpoint: Endpoint {
    case login(email: String, password: String)
    case signUp(username: String, email: String, password: String)
    case logout
    case refreshToken
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .signUp:
            return "/auth/signup"
        case .logout:
            return "/auth/logout"
        case .refreshToken:
            return "/auth/refresh"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .signUp, .logout, .refreshToken:
            return .post
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var body: Data? {
        let encoder = JSONEncoder()
        
        switch self {
        case .login(let email, let password):
            let loginData = ["email": email, "password": password]
            return try? encoder.encode(loginData)
            
        case .signUp(let username, let email, let password):
            let signUpData = [
                "username": username,
                "email": email,
                "password": password
            ]
            return try? encoder.encode(signUpData)
            
        case .logout, .refreshToken:
            return nil
        }
    }
}
