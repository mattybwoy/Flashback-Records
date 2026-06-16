//
//  ProfileScreenViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/06/2026.
//

import Foundation

protocol ProfileViewControllerFactory {
    func makeProfileViewController(navigationDelegate: ProfileNavigationDelegate, onDismissed: (() -> Void)?) -> ProfileViewController<ProfileView>
}

extension DependencyContainer: ProfileViewControllerFactory {

    @MainActor
    func makeProfileViewController(navigationDelegate: ProfileNavigationDelegate, onDismissed: (() -> Void)?) -> ProfileViewController<ProfileView> {
        let authenticationService = AuthenticationRepositoryImpl()
        let LoginUseCase = LoginUseCase(authenticationService: authenticationService)
        let SignUpUseCase = SignUpUseCase(authenticationService: authenticationService)
        let newsLetterUseCase = SubscribeNewsletterUseCase(authenticationService: authenticationService)
        let profileViewModel = ProfileViewModel(loginUseCase: LoginUseCase, signUpUseCase: SignUpUseCase, subscribeNewsletterUseCase: newsLetterUseCase)
        let profileView = ProfileView(viewModel: profileViewModel)
        let profileViewController = ProfileViewController(view: profileView)
        profileViewController.onDismissed = onDismissed
        return profileViewController
    }
}
