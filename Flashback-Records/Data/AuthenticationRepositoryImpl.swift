//
//  AuthenticationRepositoryImpl.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/12/2025.
//

final class AuthenticationRepositoryImpl: AuthenticationRepository {
    
    func login(username: String, password: String) async throws -> User? {
        print("logged in")
        return nil
    }
    
    func signUp(username: String, password: String) async throws -> User? {
        print("signed up")
        return nil
    }
    
}
