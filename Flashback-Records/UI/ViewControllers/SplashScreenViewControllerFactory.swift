//
//  SplashScreenViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 18/05/2025.
//
import Foundation

protocol SplashScreenViewControllerFactory {
    func make(navigationDelegate: SplashScreenNavigationDelegate, onDismissed: (() -> Void)?) -> SplashScreenViewController<SplashView>
}

extension DependencyContainer: SplashScreenViewControllerFactory {

    func make(navigationDelegate: SplashScreenNavigationDelegate, onDismissed: (() -> Void)?) -> SplashScreenViewController<SplashView> {
        let splashScreenViewModel = SplashScreenViewModel(navigationDelegate: navigationDelegate)
        let splashScreenView = SplashView(viewModel: splashScreenViewModel)
        let splashScreenViewController = SplashScreenViewController(view: splashScreenView)
        splashScreenViewController.onDismissed = onDismissed
        return splashScreenViewController
    }
}
