//
//  AccountCreationViewModel.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 28/06/2026.
//

import SwiftUI

protocol AccountCreationScreenNavigationDelegate: AnyObject {
    func returnToProfileScreen()
    func navigateToLoginScreen()
}

@MainActor
final class AccountCreationViewModel: ObservableObject {
    
    @Published var userState: UserState = .notLoggedIn
    let navigationDelegate: AccountCreationScreenNavigationDelegate
    
    private let signUpUseCase: SignUpUseCase
    
    init(
        navigationDelegate: AccountCreationScreenNavigationDelegate,
        signUpUseCase: SignUpUseCase
    ) {
        self.navigationDelegate = navigationDelegate
        self.signUpUseCase = signUpUseCase
        userState = .notLoggedIn
    }
    
    func signUp(username: String, password: String) async throws -> User? {
        userState = .loading
        do {
            let result = try await signUpUseCase.signUp(username: username, password: password)
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
    
    func didTappedSignIn() {
        userState = .notLoggedIn
        navigationDelegate.navigateToLoginScreen()
    }
    
}
