//
//  AccountCreationCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 27/06/2026.
//

import NavigateCoordinator

final class AccountCreationCoordinator: Coordinator {
    
    typealias Factory = AccountCreationViewControllerFactory & AccountLoginCoordinatorFactory
    
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
        let viewController: ViewController = factory.makeAccountCreationViewController(
            navigationDelegate: self,
            onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }

}

extension AccountCreationCoordinator: AccountCreationScreenNavigationDelegate {
    @MainActor
    func returnToProfileScreen() {
        finish(animated: true)
    }
    
    @MainActor
    func navigateToLoginScreen() {
        finish(animated: false)
        let loginCoordinator = factory.makeAccountLoginCoordinator(navigator: navigator)
        parentCoordinator?.startChild(loginCoordinator, transition: .push(animated: true), onDismissed: nil)
    }
    
}
