//
//  AccountCreationCoordinatorFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 27/06/2026.
//

import NavigateCoordinator

protocol AccountCreationCoordinatorFactory {
    func makeAccountCreationCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: AccountCreationCoordinatorFactory {
    
    func makeAccountCreationCoordinator(navigator: Navigator) -> Coordinator {
        AccountCreationCoordinator(navigator: navigator, factory: self)
    }
}
