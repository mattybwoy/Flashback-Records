//
//  OrderViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 19/06/2026.
//

import Foundation

protocol OrderViewControllerFactory {
    func makeOrderViewController(navigationDelegate: OrderNavigationDelegate, onDismissed: (() -> Void)?) -> OrderViewController<OrderView>
}

extension DependencyContainer: OrderViewControllerFactory {
    @MainActor
    func makeOrderViewController(navigationDelegate: OrderNavigationDelegate, onDismissed: (() -> Void)?) -> OrderViewController<OrderView> {
        let OrderView = OrderView()
        let OrderViewController = OrderViewController(view: OrderView)
        OrderViewController.onDismissed = onDismissed
        return OrderViewController
    }
}
