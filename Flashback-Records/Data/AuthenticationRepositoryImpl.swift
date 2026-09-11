//
//  AuthenticationRepositoryImpl.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/12/2025.
//

final class AuthenticationRepositoryImpl: AuthenticationRepository {
    
    let apiClient: NetworkService
    
    init(apiClient: NetworkService) {
        self.apiClient = apiClient
    }
    
    func login(email username: String, password: String) async throws -> User? {
        print("logged in")
        return nil
    }
    
    func signUp(username: String, email: String, password: String) async throws -> User? {
        print("signed up")
        return nil
    }
    
}
