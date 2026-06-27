//
//  AccountCreationCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 27/06/2026.
//

import NavigateCoordinator

final class AccountCreationCoordinator: Coordinator {
    
    typealias Factory = AccountCreationViewControllerFactory
    
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
        let viewController: ViewController = factory.makeAccountCreationViewController(onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }

}
