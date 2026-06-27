//
//  SplashViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 18/05/2025.
//
import Foundation

protocol SplashViewControllerFactory {
    func make(
        navigationDelegate: SplashNavigationDelegate,
        onDismissed: (() -> Void)?) -> SplashViewController<SplashView>
}

extension DependencyContainer: SplashViewControllerFactory {

    func make(
        navigationDelegate: SplashNavigationDelegate,
        onDismissed: (() -> Void)?) -> SplashViewController<SplashView> {
        let splashViewModel = SplashViewModel(navigationDelegate: navigationDelegate)
        let splashView = SplashView(viewModel: splashViewModel)
        let splashViewController = SplashViewController(view: splashView)
        splashViewController.onDismissed = onDismissed
        return splashViewController
    }
}
