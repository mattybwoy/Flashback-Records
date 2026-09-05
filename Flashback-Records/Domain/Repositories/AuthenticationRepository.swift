//
//  AuthenticationRepository.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/12/2025.
//

protocol AuthenticationRepository {
    func login(email: String, password: String) async throws -> User?
    func signUp(username: String, email: String, password: String) async throws -> User?
}
