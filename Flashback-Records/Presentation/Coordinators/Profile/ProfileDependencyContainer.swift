//
//  ProfileDependencyContainer.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 11/09/2026.
//

final class ProfileDependencyContainer {
    let authenticationService: AuthenticationRepository = AuthenticationRepositoryImpl(apiClient: NetworkClient.shared)
}
