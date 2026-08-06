//
//  TabBarViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/03/2025.
//

import NavigateCoordinator
import UIKit

final class TabBarViewController: BasicTabBarController {
    
    private var wishlistNav: BasicNavigationController
    private var searchNav: BasicNavigationController
    private var orderNav: BasicNavigationController
    private var profileNav: BasicNavigationController
    
    init(wishlistNav: BasicNavigationController,
         searchNav: BasicNavigationController,
         orderNav: BasicNavigationController,
         profileNav: BasicNavigationController) {
        self.wishlistNav = wishlistNav
        self.searchNav = searchNav
        self.orderNav = orderNav
        self.profileNav = profileNav
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItems()
    }
    
    private func setupTabBarItems() {

        let font = UIFont(name: "Jost-Regular", size: 12)!

        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()

        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: font,
            .foregroundColor: UIColor.black
        ]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: font,
            .foregroundColor: UIColor.black
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .black
        appearance.stackedLayoutAppearance.selected.iconColor = .black
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        wishlistNav.tabBarItem = UITabBarItem(title: "WISHLIST", image: UIImage(systemName: "list.clipboard"), tag: 0)
        
        searchNav.tabBarItem = UITabBarItem(title: "SEARCH", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        orderNav.tabBarItem = UITabBarItem(title: "ORDERS", image: UIImage(systemName: "shippingbox"), tag: 2)
        
        profileNav.tabBarItem = UITabBarItem(title: "PROFILE", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        
        self.viewControllers = [wishlistNav, searchNav, orderNav, profileNav]
    }
}

extension TabBarViewController: TabBarNavigationDelegate {
    func navigateToWishlist() {
        selectedIndex = 0
    }
    func navigateToSearch() {
        selectedIndex = 1
    }
    func navigateToOrders() {
        selectedIndex = 2
    }
    func navigateToProfile() {
        selectedIndex = 3
    }
}
