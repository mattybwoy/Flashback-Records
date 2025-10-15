//
//  TabBarViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/03/2025.
//

import SwiftUI
import NavigateCoordinator
import UIKit

final class TabBarViewController: BasicViewController, UITabBarControllerDelegate {
    
    private var wishListVC: BasicViewController
    private var searchVC: BasicViewController
    private var orderVC: BasicViewController
    private var profileVC: BasicViewController
    private var homeTabBarController: BasicTabBarController
    
    init(wishlistVC: WishlistViewController<WishlistView>,
         searchVC: SearchViewController<SearchView>,
         orderVC: OrderViewController<OrderView>,
         profileVC: ProfileViewController<ProfileView>,
         homeTabBarController: BasicTabBarController) {
        self.wishListVC = wishlistVC
        self.searchVC = searchVC
        self.orderVC = orderVC
        self.profileVC = profileVC
        self.homeTabBarController = homeTabBarController
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
       
//    override var tabBarController: UITabBarController? {
//        super.tabBarController
//    }
    
    private func setupTabBarView() {
        let controller = self.homeTabBarController
        
        wishListVC.tabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(systemName: "list.clipboard"), tag: 0)
        
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        orderVC.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "shippingbox"), tag: 2)
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        controller.viewControllers = [wishListVC, searchVC, orderVC, profileVC]

            addChild(controller)
            controller.view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(controller.view)
            controller.didMove(toParent: self)
        
            NSLayoutConstraint.activate([
                controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
                controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
                controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }
}

extension TabBarViewController: TabBarNavigationDelegate {
    func navigateToSearchScreen() {
        print("okay")
    }
    
}
