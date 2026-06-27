//
//  OrderCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 19/06/2026.
//

import NavigateCoordinator

protocol OrderNavigationDelegate: AnyObject {
}

final class OrderCoordinator: Coordinator {

    typealias Factory = OrderViewControllerFactory
    
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
        let viewController: ViewController = factory.makeOrderViewController(
            navigationDelegate: self,
            onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }
    
}

extension OrderCoordinator: @preconcurrency OrderNavigationDelegate {
    
}
