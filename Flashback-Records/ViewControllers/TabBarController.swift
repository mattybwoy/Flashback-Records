//
//  TabBarController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/03/2025.
//

import SwiftUI
import NavigateCoordinator

final class TabBarController<T: TabBarInterface>: BasicViewController, UITabBarControllerDelegate {
    
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
       setupTabs()
        //self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        
//        let tabOne = WishlistViewController()
//        let tabOneBarItem = UITabBarItem(title: "Wishlist", image: UIImage(systemName: "list.clipboard"), selectedImage: UIImage(systemName: "list.clipboard"))
//        tabOne.tabBarItem = tabOneBarItem
//        
//        let tabTwo = SearchViewController()
//        let tabTwoBarItem2 = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
//        tabTwo.tabBarItem = tabTwoBarItem2
//        
//        let tabThree = OrdersViewController()
//        let tabThreeBarItem3 = UITabBarItem(title: "Orders", image: UIImage(systemName: "shippingbox"), selectedImage: UIImage(systemName: "shippingbox"))
//        tabThree.tabBarItem = tabThreeBarItem3
//        
//        let tabFour = ProfileViewController()
//        let tabFourBarItem4 = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle"))
//        tabFour.tabBarItem = tabFourBarItem4
//        
//        self.tabBarController?.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
       
       // UITabBarControllerDelegate method
       func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           print("Selected \(viewController.title!)")
       }
    
    private func setupView() {
        let controller = UIHostingController(rootView: tabBarView.tabBarView)
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
    
    private func setupTabs() {
        let homeView = UIHostingController(rootView: HomeTabBarView().tabBarView)
        homeView.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        self.tabBarController?.viewControllers = [homeView]
    }
}

extension TabBarController: TabBarNavigationDelegate {
    func navigateToSearchScreen() {
        print("okay")
    }
    
    
}
