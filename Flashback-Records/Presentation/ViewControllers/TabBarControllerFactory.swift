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

    @MainActor func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> TabBarViewController {
        
        let wishlistVC = WishlistViewController(view: WishlistView())
        let searchVC = SearchViewController(view: SearchView())
        let orderVC = OrderViewController(view: OrderView())
        
        let authenticationService = AuthenticationRepositoryImpl()
        let profileVM = ProfileScreenViewModel(loginUseCase: LoginUseCase(authenticationService: authenticationService),
                                               signUpUseCase: SignUpUseCase(authenticationService: authenticationService),
                                               subscribeNewsletterUseCase: SubscribeNewsletterUseCase(authenticationService: authenticationService))
        
        let profileVC = ProfileViewController(view: ProfileView(viewModel: profileVM))
        
        let tabBarController = TabBarViewController(wishlistVC: wishlistVC,
                                                    searchVC: searchVC,
                                                    orderVC: orderVC,
                                                    profileVC: profileVC)
        
        tabBarController.viewControllers = [wishlistVC, searchVC, orderVC, profileVC]
        tabBarController.onDismissed = onDismissed
        
        return tabBarController
    }
}
