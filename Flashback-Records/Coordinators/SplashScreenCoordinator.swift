//
//  SplashScreenCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 18/05/2025.
//

import NavigateCoordinator

final class SplashScreenCoordinator: Coordinator, SplashScreenNavigationDelegate {

    typealias Factory = SplashScreenViewControllerFactory
    
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
        let viewController: ViewController = factory.make(navigationDelegate: self, onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }
    
    func initializeHomeTabBar() {
        
    }
    
}
