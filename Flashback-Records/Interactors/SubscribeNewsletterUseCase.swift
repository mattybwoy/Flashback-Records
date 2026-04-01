//
//  SubscribeNewsletterUseCase.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 23/03/2026.
//

struct SubscribeNewsletterUseCase {
    let authenticationService: AuthenticationRepository
    
    func subscribe(email: String) async throws -> Result<User, SubscribeError> {
        //try await authenticationService.signUp(username: username, password: password)
        return .failure(.invalidEmail)
    }
}
