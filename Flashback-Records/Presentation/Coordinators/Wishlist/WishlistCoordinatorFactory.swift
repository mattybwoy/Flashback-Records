//
//  WishlistCoordinatorFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 16/06/2026.
//

import NavigateCoordinator

protocol WishlistCoordinatorFactory {
    func makeWishlistCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: WishlistCoordinatorFactory {
    func makeWishlistCoordinator(navigator: Navigator) -> Coordinator {
        WishlistCoordinator(navigator: navigator, factory: self)
    }
}
