//
//  SearchCoordinatorFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 16/06/2026.
//

import NavigateCoordinator

protocol SearchCoordinatorFactory {
    func makeSearchCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: SearchCoordinatorFactory {
    func makeSearchCoordinator(navigator: Navigator) -> Coordinator {
        SearchCoordinator(navigator: navigator, factory: self)
    }
}
