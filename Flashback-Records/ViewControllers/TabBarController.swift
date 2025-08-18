//
//  TabBarViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/03/2025.
//

import SwiftUI
import NavigateCoordinator

final class TabBarViewController<T: TabBarInterface>: BasicViewController, UITabBarControllerDelegate {
    
    private var tabBarView: T
    private var wishListVC: BasicViewController
    private var searchVC: BasicViewController
    private var orderVC: BasicViewController
    private var profileVC: BasicViewController
    
    init(view: T, wishlistVC: WishlistViewController<WishlistView>,
         searchVC: SearchViewController<SearchView>,
         orderVC: OrderViewController<OrderView>,
         profileVC: ProfileViewController<ProfileView>) {
        self.tabBarView = view
        self.wishListVC = wishlistVC
        self.searchVC = searchVC
        self.orderVC = orderVC
        self.profileVC = profileVC
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
       
    private func setupTabBarView() {
        let controller = UITabBarController()
        
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
