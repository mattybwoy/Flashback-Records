//
//  TabBarViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 24/06/2025.
//

import Foundation
import NavigateCoordinator

protocol TabBarViewControllerFactory {
    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> TabBarViewController<HomeTabBarView>
}

extension DependencyContainer: TabBarViewControllerFactory {

    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> TabBarViewController<HomeTabBarView> {
        let tabBarView = HomeTabBarView()
        
        let wishlistVC = WishlistViewController(view: WishlistView())
        let searchVC = SearchViewController(view: SearchView())
        let orderVC = OrderViewController(view: OrderView())
        let profileVC = ProfileViewController(view: ProfileView())
        
        let TabBarViewController = TabBarViewController(view: tabBarView, wishlistVC: wishlistVC, searchVC: searchVC, orderVC: orderVC, profileVC: profileVC)
        TabBarViewController.onDismissed = onDismissed
        return TabBarViewController
    }
}
