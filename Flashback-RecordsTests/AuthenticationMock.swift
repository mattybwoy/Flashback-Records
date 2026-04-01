//
//  AuthenticationMock.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 23/03/2026.
//
@testable import Flashback_Records

final class AuthenticationMock: AuthenticationRepository {
    func login(username: String, password: String) async throws -> Flashback_Records.User? {
        return User(id: .init(), token: "999")
    }
    
    func signUp(username: String, password: String) async throws -> Flashback_Records.User? {
        return User(id: .init(), token: "123")
    }
}
