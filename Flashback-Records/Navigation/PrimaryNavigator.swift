//
//  PrimaryNavigator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 25/03/2025.
//
import Foundation
import UIKit

final class PrimaryNavigator: Navigator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to viewController: UIViewController, transition: Transition) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    func exitFlow(coordinator: any Coordinator, animated: Bool) {
        fatalError("shouldn't exit")
    }
    
    func dismiss(animated: Bool) {
        fatalError("shouldn't dimsiss")
    }
    
    func popToRootViewController(animated: Bool) {
        fatalError("shouldn't pop to root")
    }
    
    func popViewController(animated: Bool) {
        fatalError("shouldn't pop")
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool) {
        fatalError("shouldn't pop to root")
    }
    
    
}
