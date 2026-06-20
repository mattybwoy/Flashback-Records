//
//  ProfileCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/06/2026.
//
import NavigateCoordinator

protocol ProfileNavigationDelegate: AnyObject {
    // func initializeHomeTabBar()
}

final class ProfileCoordinator: Coordinator {

    typealias Factory = ProfileViewControllerFactory
    
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
        let viewController: ViewController = factory.makeProfileViewController(navigationDelegate: self, onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }
    
}

extension ProfileCoordinator: @preconcurrency ProfileNavigationDelegate {
    
//    @MainActor
//    func initializeHomeTabBar() {
//        let coordinator = factory.makeTabBarCoordinator(navigator: navigator)
//        startChild(coordinator, transition: .push(animated: true), onDismissed: nil)
//    }
    
}
