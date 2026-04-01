//
//  ProfileScreenViewModel.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 29/11/2025.
//
import SwiftUI

@MainActor
final class ProfileScreenViewModel: ObservableObject {
    
    @Published var userState: userState = .notLoggedIn
    
    private let loginUseCase: LoginUseCase
    private let signUpUseCase: SignUpUseCase
    private let subscribeNewsletterUseCase: SubscribeNewsletterUseCase
    
    init(loginUseCase: LoginUseCase, signUpUseCase: SignUpUseCase, subscribeNewsletterUseCase: SubscribeNewsletterUseCase) {
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
}

enum userState {
    case notLoggedIn
    case loading
    case loggedIn(User)
    case error(Error)
}
