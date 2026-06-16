//
//  WishlistCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 16/06/2026.
//

import NavigateCoordinator

protocol WishlistNavigationDelegate: AnyObject {
}

final class WishlistCoordinator: Coordinator {

    typealias Factory = WishlistViewControllerFactory
    
    var childCoordinators: [any Coordinator] = []
    
    let navigator: Navigator
    let factory: Factory
    weak var baseViewController: ViewController?
    unowned var parentCoordinator: Coordinator?
    
    init(navigator: Navigator, factory: Factory) {
        self.navigator = navigator
        self.factory = factory
    }
    
    @MainActor
    func start(transition: NavigateCoordinator.Transition, onDismissed: (() -> Void)?) {
        let viewController: ViewController = factory.makeWishlistViewController(navigationDelegate: self, onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }
    
}

extension WishlistCoordinator: @preconcurrency WishlistNavigationDelegate {
    
}
