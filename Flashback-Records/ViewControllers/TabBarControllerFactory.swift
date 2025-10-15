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
    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> TabBarViewController
}

extension DependencyContainer: TabBarViewControllerFactory {

    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> TabBarViewController {
        
        let wishlistVC = WishlistViewController(view: WishlistView())
        let searchVC = SearchViewController(view: SearchView())
        let orderVC = OrderViewController(view: OrderView())
        let profileVC = ProfileViewController(view: ProfileView())
        let tabBarController: TabController = BasicTabBarController()
        
        let tabBarVC = TabBarViewController(wishlistVC: wishlistVC,
                                            searchVC: searchVC,
                                            orderVC: orderVC,
                                            profileVC: profileVC,
                                            homeTabBarController: tabBarController as! BasicTabBarController
        )
//        wishlistVC.tabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(systemName: "list.clipboard"), tag: 0)
//        
//        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
//        
//        orderVC.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "shippingbox"), tag: 2)
//        
//        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
//        TabBarViewController.tabBarController?.viewControllers = [wishlistVC, searchVC, orderVC, profileVC]

        
        tabBarVC.onDismissed = onDismissed
        return tabBarVC
    }
}

