//
//  SignUpUseCase.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 02/03/2026.
//

protocol SignUpUseCaseProtocol {
    func signUp(username: String, password: String) async throws -> Result<User, AuthenticationError>
}

struct SignUpUseCase {
    let authenticationService: AuthenticationRepository
    
    func signUp(username: String, password: String) async throws -> Result<User, AuthenticationError> {
        // try await authenticationService.signUp(username: username, password: password)
        return .failure(.invalidCredentials)
    }
}
