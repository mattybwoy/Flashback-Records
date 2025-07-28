//
//  TabBarCoordinatorFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 04/07/2025.
//

import NavigateCoordinator

protocol TabBarCoordinatorFactory {
    func makeTabBarCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: TabBarCoordinatorFactory {
    func makeTabBarCoordinator(navigator: Navigator) -> Coordinator {
        TabBarCoordinator(navigator: navigator, factory : self)
    }
}
