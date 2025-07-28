//
//  TabBarControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 24/06/2025.
//

import Foundation
import NavigateCoordinator

protocol TabBarControllerFactory {
    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> TabBarController<HomeTabBarView>
}

extension DependencyContainer: TabBarControllerFactory {

    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> TabBarController<HomeTabBarView> {
        let tabBarView = HomeTabBarView()
        let tabBarController = TabBarController(view: tabBarView)
        tabBarController.onDismissed = onDismissed
        return tabBarController
    }
}
