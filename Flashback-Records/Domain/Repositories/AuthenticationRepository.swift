//
//  AuthenticationRepository.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/12/2025.
//

protocol AuthenticationRepository {
    func login(username: String, password: String) async throws -> User?
    func signUp(username: String, password: String) async throws -> User?
}
