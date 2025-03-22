//
//  Navigator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 22/03/2025.
//
import Foundation
import UIKit

public protocol Navigator {
    func navigate(to viewController: UIViewController, transition: Transition)
    func exitFlow(coordinator: Coordinator, animated: Bool)
    func dismiss(animated: Bool)
    func popToRootViewController(animated: Bool)
    func popViewController(animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
}
