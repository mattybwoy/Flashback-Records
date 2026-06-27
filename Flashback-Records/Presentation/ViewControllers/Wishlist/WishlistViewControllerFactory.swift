//
//  WishlistViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 16/06/2026.
//

import Foundation

protocol WishlistViewControllerFactory {
    func makeWishlistViewController(
        navigationDelegate: WishlistNavigationDelegate,
        onDismissed: (() -> Void)?) -> WishlistViewController<WishlistView>
}

extension DependencyContainer: WishlistViewControllerFactory {
    @MainActor
    func makeWishlistViewController(
        navigationDelegate: WishlistNavigationDelegate,
        onDismissed: (() -> Void)?) -> WishlistViewController<WishlistView> {
        let wishlistView = WishlistView()
        let wishlistViewController = WishlistViewController(view: wishlistView)
        wishlistViewController.onDismissed = onDismissed
        return wishlistViewController
    }
}
