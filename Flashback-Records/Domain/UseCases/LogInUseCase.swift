//
//  LoginUseCase.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/12/2025.
//
protocol LogInUseCaseProtocol {
    func login(username: String, password: String) async throws -> Result<User, AuthenticationError>
}

struct LogInUseCase: LogInUseCaseProtocol {
    let authenticationService: AuthenticationRepository
    
    func login(username: String, password: String) async throws -> Result<User, AuthenticationError> {
        // try await authenticationService.login(username: username, password: password)
        // return User(id: .init(), token: "123")
        return .failure(.invalidCredentials)
    }
}
