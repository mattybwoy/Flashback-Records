//
//  TabBarCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 27/06/2025.
//
import NavigateCoordinator

final class TabBarCoordinator: Coordinator {

    typealias Factory = TabBarControllerFactory

    var childCoordinators: [Coordinator] = []

    let navigator: Navigator
    let factory: Factory
    weak var baseViewController: ViewController?
    var parentCoordinator: Coordinator?

    init(navigator: Navigator, factory: Factory) {
        self.navigator = navigator
        self.factory = factory
    }

    @MainActor
    func start(transition: Transition, onDismissed: (() -> Void)?) {
        let viewController: ViewController = factory.makeTabBar(tabBarNavigationDelegate: self, onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }
}

extension TabBarCoordinator: @preconcurrency TabBarNavigationDelegate {
    
    @MainActor
    func navigateToSearchScreen() {
        finish(animated: true)
    }
}
