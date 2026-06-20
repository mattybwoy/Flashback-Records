//
//  OrderCoordinatorFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 19/06/2026.
//

import NavigateCoordinator

protocol OrderCoordinatorFactory {
    func makeOrderCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: OrderCoordinatorFactory {
    func makeOrderCoordinator(navigator: Navigator) -> Coordinator {
        OrderCoordinator(navigator: navigator, factory: self)
    }
}
