//
//  ProfileCoordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/06/2026.
//
import NavigateCoordinator

final class ProfileCoordinator: Coordinator {

    typealias Factory =
        ProfileViewControllerFactory &
        AccountCreationCoordinatorFactory &
        AccountLoginCoordinatorFactory

    var childCoordinators: [any Coordinator] = []

    let navigator: Navigator
    let factory: Factory
    weak var baseViewController: ViewController?
    unowned var parentCoordinator: Coordinator?
    weak var tabSwitchDelegate: TabBarNavigationDelegate?

    init(navigator: Navigator, factory: Factory) {
        self.navigator = navigator
        self.factory = factory
    }

    @MainActor
    func start(transition: NavigateCoordinator.Transition, onDismissed: (() -> Void)?) {
        let viewController: ViewController = factory.makeProfileViewController(
            navigationDelegate: self,
            onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }

}

extension ProfileCoordinator: ProfileScreenNavigationDelegate {
    
    func signupTapped() {
        let coordinator = factory.makeAccountCreationCoordinator(navigator: navigator)
        startChild(coordinator, transition: .push(animated: true), onDismissed: nil)
    }
    
    func signinTapped() {
        let coordinator = factory.makeAccountLoginCoordinator(navigator: navigator)
        startChild(coordinator, transition: .push(animated: true), onDismissed: nil)
    }
}
