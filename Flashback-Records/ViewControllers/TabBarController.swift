//
//  TabBarController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/03/2025.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = .darkGray
        tabBar.tintColor = .systemYellow
        tabBar.barTintColor = .darkGray
        tabBar.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabOne = WishlistViewController()
        let tabOneBarItem = UITabBarItem(title: "Wishlist", image: UIImage(systemName: "list.clipboard"), selectedImage: UIImage(systemName: "list.clipboard"))
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = SearchViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        tabTwo.tabBarItem = tabTwoBarItem2
        
        let tabThree = OrdersViewController()
        let tabThreeBarItem3 = UITabBarItem(title: "Orders", image: UIImage(systemName: "shippingbox"), selectedImage: UIImage(systemName: "shippingbox"))
        tabThree.tabBarItem = tabThreeBarItem3
        
        let tabFour = ProfileViewController()
        let tabFourBarItem4 = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle"))
        tabFour.tabBarItem = tabFourBarItem4
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
       
       // UITabBarControllerDelegate method
       func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           print("Selected \(viewController.title!)")
       }
}
