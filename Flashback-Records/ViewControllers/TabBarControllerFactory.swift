//
//  TabBarViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 24/06/2025.
//

import Foundation
import NavigateCoordinator
import UIKit

protocol TabBarViewControllerFactory {
    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> BasicTabBarController
}

extension DependencyContainer: TabBarViewControllerFactory {

    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> BasicTabBarController {
        
        let wishlistVC = WishlistViewController(view: WishlistView())
        let searchVC = SearchViewController(view: SearchView())
        let orderVC = OrderViewController(view: OrderView())
        let profileVC = ProfileViewController(view: ProfileView())
        
        let tabBarController = TabBarViewController(wishlistVC: wishlistVC,
                                                    searchVC: searchVC,
                                                    orderVC: orderVC,
                                                    profileVC: profileVC)
        
        tabBarController.viewControllers = [wishlistVC, searchVC, orderVC, profileVC]
        tabBarController.onDismissed = onDismissed
        
        return tabBarController
    }
}

