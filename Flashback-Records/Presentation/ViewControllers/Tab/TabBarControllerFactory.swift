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

        let wishlistNav = BasicNavigationController()
        let wishlistNavigator = BasicNavigator(navigationController: wishlistNav)
        let wishlistCoordinator = WishlistCoordinator(navigator: wishlistNavigator, factory: self)
        let wishlistVC = makeWishlistViewController(
            navigationDelegate: wishlistCoordinator,
            onDismissed: nil)
        wishlistNav.navigationBar.isHidden = true
        wishlistNav.setViewControllers([wishlistVC], animated: false)

        let searchNav = BasicNavigationController()
        let searchNavigator = BasicNavigator(navigationController: searchNav)
        let searchCoordinator = SearchCoordinator(navigator: searchNavigator, factory: self)
        let searchVC = makeSearchViewController(
            navigationDelegate: searchCoordinator,
            onDismissed: nil)
        searchNav.navigationBar.isHidden = true
        searchNav.setViewControllers([searchVC], animated: false)

        let orderNav = BasicNavigationController()
        let orderNavigator = BasicNavigator(navigationController: orderNav)
        let orderCoordinator = OrderCoordinator(navigator: orderNavigator, factory: self)
        let orderVC = makeOrderViewController(
            navigationDelegate: orderCoordinator,
            onDismissed: nil)
        orderNav.navigationBar.isHidden = true
        orderNav.setViewControllers([orderVC], animated: false)

        let profileNav = BasicNavigationController()
        let profileNavigator = BasicNavigator(navigationController: profileNav)
        let profileCoordinator = ProfileCoordinator(navigator: profileNavigator, factory: self)
        let profileVC = makeProfileViewController(
            navigationDelegate: profileCoordinator,
            onDismissed: nil)
        profileNav.navigationBar.isHidden = true
        profileNav.setViewControllers([profileVC], animated: false)

        let tabBarController = TabBarViewController(wishlistNav: wishlistNav,
                                                    searchNav: searchNav,
                                                    orderNav: orderNav,
                                                    profileNav: profileNav)

        tabBarController.onDismissed = onDismissed

        return tabBarController
    }
}
