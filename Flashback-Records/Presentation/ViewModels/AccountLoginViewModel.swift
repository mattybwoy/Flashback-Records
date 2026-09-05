//
//  AccountLoginViewModel.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 04/07/2026.
//

import SwiftUI

protocol AccountLoginScreenNavigationDelegate: AnyObject {
    func returnToProfileScreen()
    func navigateToAccountCreationScreen()
}

@MainActor
final class AccountLoginViewModel: ObservableObject {
    
    @Published var userState: UserState = .notLoggedIn
    let navigationDelegate: AccountLoginScreenNavigationDelegate
    
    private let loginUseCase: LogInUseCase
    
    init(
        navigationDelegate: AccountLoginScreenNavigationDelegate,
        loginUseCase: LogInUseCase
    ) {
        self.navigationDelegate = navigationDelegate
        self.loginUseCase = loginUseCase
        userState = .notLoggedIn
    }
    
    func login(email: String, password: String) async throws -> User? {
        userState = .loading
        do {
            let result = try await loginUseCase.login(email: email, password: password)
            switch result {
            case .success(let user):
                userState = .loggedIn(user)
                return user
            case .failure(let error):
                print(error.localizedDescription)
                throw error
            }
        } catch {
            userState = .error(error)
            throw error
        }
    }
    
    func didTappedBack() {
        userState = .notLoggedIn
        navigationDelegate.returnToProfileScreen()
    }
    
    func didTappedAccountCreationScreen() {
        userState = .notLoggedIn
        navigationDelegate.navigateToAccountCreationScreen()
    }
    
}
