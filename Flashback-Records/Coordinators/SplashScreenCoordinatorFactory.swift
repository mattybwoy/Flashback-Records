//
//  SplashScreenCoordinatorFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 18/05/2025.
//
import NavigateCoordinator

protocol SplashScreenCoordinatorFactory {
    func makeSplashScreenCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: SplashScreenCoordinatorFactory {
    func makeSplashScreenCoordinator(navigator: Navigator) -> Coordinator {
        SplashScreenCoordinator(navigator: navigator, factory : self)
    }
}
