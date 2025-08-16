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
    
    init(view: T) {
        self.tabBarView = view
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
       
    private func setupView() {
        let controller = UITabBarController()
        
        let wishlist = UIHostingController(rootView: WishlistView())
        wishlist.tabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(systemName: "list.clipboard"), tag: 0)
        
        let search = UIHostingController(rootView: SearchView())
        search.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let orders = UIHostingController(rootView: OrderView())
        orders.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(systemName: "shippingbox"), tag: 2)
        
        let profile = UIHostingController(rootView: ProfileView())
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        
        controller.viewControllers = [wishlist, search, orders, profile]
        
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
