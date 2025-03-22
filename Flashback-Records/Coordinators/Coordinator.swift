//
//  Coordinator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 22/03/2025.
//
import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigator: Navigator { get }
    var baseViewController: UIViewController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func startChildCoordinator(_ child: Coordinator, transition: Transition, onDismiss: (() -> Void)?)
    func start(transition: Transition, onDismiss: (() -> Void)?)
    func finish(animated: Bool)
}

public extension Coordinator {
    
    func finish(animated: Bool = true) {
        navigator.exitFlow(coordinator: self, animated: animated)
    }
    
    func startChildCoordinator(_ child: Coordinator, transition: Transition, onDismiss: (() -> Void)?) {
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start(transition: transition) { [weak self, weak child] in
            guard let self, let child else { return }
            self.removeChild(child)
            onDismiss?()
        }
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === child }) else {
            return
        }
        
        childCoordinators.remove(at: index)
    }
}
