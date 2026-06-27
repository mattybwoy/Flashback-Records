//
//  ProfileScreenViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/06/2026.
//

import Foundation

protocol ProfileViewControllerFactory {
    func makeProfileViewController(
        navigationDelegate: ProfileScreenNavigationDelegate,
        onDismissed: (() -> Void)?) -> ProfileViewController<ProfileView>
}

protocol AccountCreationViewControllerFactory {
    func makeAccountCreationViewController(
        onDismissed: (() -> Void)?) -> AccountCreationViewController<AccountCreationView>
}

extension DependencyContainer: ProfileViewControllerFactory {

    @MainActor
    func makeProfileViewController(
        navigationDelegate: ProfileScreenNavigationDelegate,
        onDismissed: (() -> Void)?) -> ProfileViewController<ProfileView> {
        let authenticationService = AuthenticationRepositoryImpl()
        let loginUseCase = LoginUseCase(authenticationService: authenticationService)
        let signUpUseCase = SignUpUseCase(authenticationService: authenticationService)
        let newsLetterUseCase = SubscribeNewsletterUseCase(authenticationService: authenticationService)
        let profileViewModel = ProfileViewModel(
            navigationDelegate: navigationDelegate,
            loginUseCase: loginUseCase,
            signUpUseCase: signUpUseCase,
            subscribeNewsletterUseCase: newsLetterUseCase)
        let profileView = ProfileView(viewModel: profileViewModel)
        let profileViewController = ProfileViewController(view: profileView)
        profileViewController.onDismissed = onDismissed
        return profileViewController
    }
}

extension DependencyContainer: AccountCreationViewControllerFactory {
    func makeAccountCreationViewController(
        onDismissed: (() -> Void)?) -> AccountCreationViewController<AccountCreationView> {
        let accountCreationView = AccountCreationView()
        let accountCreationViewController = AccountCreationViewController(view: accountCreationView)
        accountCreationViewController.onDismissed = onDismissed
        return accountCreationViewController
    }
}
