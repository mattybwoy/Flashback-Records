//
//  AccountLoginCoordinatorFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 04/07/2026.
//

import NavigateCoordinator

protocol AccountLoginCoordinatorFactory {
    func makeAccountLoginCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: AccountLoginCoordinatorFactory {
    
    func makeAccountLoginCoordinator(navigator: Navigator) -> Coordinator {
        AccountLoginCoordinator(navigator: navigator, factory: self)
    }
}
