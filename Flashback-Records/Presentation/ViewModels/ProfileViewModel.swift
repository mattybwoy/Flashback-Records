//
//  ProfileScreenViewModel.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 29/11/2025.
//
import SwiftUI

protocol ProfileScreenNavigationDelegate: AnyObject {
    func signUpTapped()
}

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published var userState: UserState = .notLoggedIn
    let navigationDelegate: ProfileScreenNavigationDelegate
    
    private let loginUseCase: LoginUseCase
    private let signUpUseCase: SignUpUseCase
    private let subscribeNewsletterUseCase: SubscribeNewsletterUseCase
    
    init(
        navigationDelegate: ProfileScreenNavigationDelegate,
        loginUseCase: LoginUseCase,
        signUpUseCase: SignUpUseCase,
        subscribeNewsletterUseCase: SubscribeNewsletterUseCase
    ) {
        self.navigationDelegate = navigationDelegate
        self.loginUseCase = loginUseCase
        self.signUpUseCase = signUpUseCase
        self.subscribeNewsletterUseCase = subscribeNewsletterUseCase
        userState = .notLoggedIn
    }
    
    func login(username: String, password: String) async throws -> User? {
        userState = .loading
        do {
            let result = try await loginUseCase.login(username: username, password: password)
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
    
    func signUpTapped() {
        navigationDelegate.signUpTapped()
    }
}

enum UserState {
    case notLoggedIn
    case loading
    case loggedIn(User)
    case error(Error)
}
