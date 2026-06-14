//
//  SplashCoordinatorFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 18/05/2025.
//
import NavigateCoordinator

protocol SplashCoordinatorFactory {
    func makeSplashCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: SplashCoordinatorFactory {
    func makeSplashCoordinator(navigator: Navigator) -> Coordinator {
        SplashCoordinator(navigator: navigator, factory : self)
    }
}
