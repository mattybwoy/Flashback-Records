//
//  WishlistViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 16/06/2026.
//

import Foundation

protocol WishlistViewControllerFactory {
    func makeWishlistViewController(
        navigationDelegate: WishlistScreenNavigationDelegate,
        onDismissed: (() -> Void)?) -> WishlistViewController<WishlistView>
}

extension DependencyContainer: WishlistViewControllerFactory {
    @MainActor
    func makeWishlistViewController(
        navigationDelegate: WishlistScreenNavigationDelegate,
        onDismissed: (() -> Void)?) -> WishlistViewController<WishlistView> {
        let viewModel = WishlistViewModel(navigationDelegate: navigationDelegate)
            let wishlistView = WishlistView(viewModel: viewModel)
        let wishlistViewController = WishlistViewController(view: wishlistView)
        wishlistViewController.onDismissed = onDismissed
        return wishlistViewController
    }
}
