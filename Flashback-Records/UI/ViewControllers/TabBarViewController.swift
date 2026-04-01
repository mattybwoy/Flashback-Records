//
//  TabBarViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/03/2025.
//

import NavigateCoordinator
import UIKit

final class TabBarViewController: BasicTabBarController {
    
    private var wishlistVC: BasicViewController
    private var searchVC: BasicViewController
    private var orderVC: BasicViewController
    private var profileVC: BasicViewController
    
    init(wishlistVC: WishlistViewController<WishlistView>,
         searchVC: SearchViewController<SearchView>,
         orderVC: OrderViewController<OrderView>,
         profileVC: ProfileViewController<ProfileView>) {
        self.wishlistVC = wishlistVC
        self.searchVC = searchVC
        self.orderVC = orderVC
        self.profileVC = profileVC
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

        let font = UIFont(name: "HelveticaNeue", size: 12)!

        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()

        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: font,
            .foregroundColor: UIColor.black
        ]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: font,
            .foregroundColor: UIColor.black,
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .black
        appearance.stackedLayoutAppearance.selected.iconColor = .black
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        wishlistVC.tabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(systemName: "list.clipboard"), tag: 0)
        
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        orderVC.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(systemName: "shippingbox"), tag: 2)
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        
        self.viewControllers = [wishlistVC, searchVC, orderVC, profileVC]
    }
}
