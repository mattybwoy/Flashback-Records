//
//  AccountLoginCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 04/07/2026.
//

import NavigateCoordinator

final class AccountLoginCoordinator: Coordinator {
    
    typealias Factory = AccountLoginViewControllerFactory
    
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
        let viewController: ViewController = factory.makeAccountLoginViewController(navigationDelegate: self, onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }

}

extension AccountLoginCoordinator: AccountLoginScreenNavigationDelegate {
    @MainActor
    func returnToProfileScreen() {
        finish(animated: true)
    }
    
}
