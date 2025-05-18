//
//  SplashScreenCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 18/05/2025.
//

import NavigateCoordinator

final class SplashScreenCoordinator: Coordinator {

    typealias Factory = SplashScreenViewControllerFactory
    
    var childCoordinators: [any Coordinator] = []
    
    let navigator: Navigator
    let factory: Factory
    weak var baseViewController: ViewController?
    unowned var parentCoordinator: Coordinator?
    
    init(navigator: Navigator, factory: Factory? = nil) {
        self.navigator = navigator
        self.factory = factory
    }
    
    func start(transition: NavigateCoordinator.Transition, onDismissed: (() -> Void)?) {
        <#code#>
    }
    
}
