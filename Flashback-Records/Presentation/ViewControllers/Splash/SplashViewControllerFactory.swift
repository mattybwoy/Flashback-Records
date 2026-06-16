//
//  SplashViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 18/05/2025.
//
import Foundation

protocol SplashViewControllerFactory {
    func make(navigationDelegate: SplashNavigationDelegate, onDismissed: (() -> Void)?) -> SplashViewController<SplashView>
}

extension DependencyContainer: SplashViewControllerFactory {

    func make(navigationDelegate: SplashNavigationDelegate, onDismissed: (() -> Void)?) -> SplashViewController<SplashView> {
        let SplashViewModel = SplashViewModel(navigationDelegate: navigationDelegate)
        let SplashView = SplashView(viewModel: SplashViewModel)
        let SplashViewController = SplashViewController(view: SplashView)
        SplashViewController.onDismissed = onDismissed
        return SplashViewController
    }
}
