//
//  TabBarViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 24/06/2025.
//

import Foundation
import NavigateCoordinator
import UIKit

protocol TabBarControllerFactory {
    func makeTabBar(tabBarNavigationDelegate: Navigator, onDismissed: (() -> Void)?) -> TabBarViewController
}

extension DependencyContainer: TabBarControllerFactory {

    @MainActor
    func makeTabBar(tabBarNavigationDelegate: Navigator, onDismissed: (() -> Void)?) -> TabBarViewController {

        let wishlistVC = makeWishlistViewController(navigationDelegate: WishlistCoordinator(navigator: tabBarNavigationDelegate, factory: self), onDismissed: nil)
        let searchVC = makeSearchViewController(navigationDelegate: SearchCoordinator(navigator: tabBarNavigationDelegate, factory: self), onDismissed: nil)
        let orderVC = OrderViewController(view: OrderView())
        let profileVC = makeProfileViewController(navigationDelegate: ProfileCoordinator(navigator: tabBarNavigationDelegate, factory: self), onDismissed: nil)

        let tabBarController = TabBarViewController(wishlistVC: wishlistVC,
                                                    searchVC: searchVC,
                                                    orderVC: orderVC,
                                                    profileVC: profileVC)

        tabBarController.onDismissed = onDismissed

        return tabBarController
    }
}
