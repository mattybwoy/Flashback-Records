//
//  PrimaryNavigator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 25/03/2025.
//
import NavigateCoordinator
import UIKit

final class PrimaryNavigator: Navigator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to viewController: NavigateCoordinator.ViewController, transition: NavigateCoordinator.Transition) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    func exitFlow(coordinator: any NavigateCoordinator.Coordinator, animated: Bool) {
        fatalError("shouldn't exit")
    }
    
    func dismiss(animated: Bool) {
        fatalError("shouldn't dismiss")
    }
    
    func popToRootViewController(animated: Bool) {
        fatalError("shouldn't pop to root")
    }
    
    func popViewController(animated: Bool) {
        fatalError("shouldn't pop")
    }
    
    func popToViewController(_ viewController: NavigateCoordinator.ViewController, animated: Bool) {
        fatalError("shouldn't pop to root")
    }
    
    
}
