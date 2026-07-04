//
//  ProfileScreenViewModel.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 29/11/2025.
//
import SwiftUI

protocol ProfileScreenNavigationDelegate: AnyObject {
    func signupTapped()
    func signinTapped()
}

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published var userState: UserState = .notLoggedIn
    let navigationDelegate: ProfileScreenNavigationDelegate
    
    private let loginUseCase: LogInUseCase
    private let subscribeNewsletterUseCase: SubscribeNewsletterUseCase
    
    init(
        navigationDelegate: ProfileScreenNavigationDelegate,
        loginUseCase: LogInUseCase,
        subscribeNewsletterUseCase: SubscribeNewsletterUseCase
    ) {
        self.navigationDelegate = navigationDelegate
        self.loginUseCase = loginUseCase
        self.subscribeNewsletterUseCase = subscribeNewsletterUseCase
        userState = .notLoggedIn
    }
    
    func subscribeToNewsletter(email: String) async throws {
        do {
            let result = try await subscribeNewsletterUseCase.subscribe(email: email)
            switch result {
            case .success:
                break
            case .failure(let error):
                // already subscribed error or invalid email error
                print(error.localizedDescription)
                throw error
            }
        }
    }
    
    func signupTapped() {
        navigationDelegate.signupTapped()
    }
    
    func signinTapped() {
        navigationDelegate.signinTapped()
    }
}

enum UserState {
    case notLoggedIn
    case loading
    case loggedIn(User)
    case error(Error)
}
