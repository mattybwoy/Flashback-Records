//
//  TabBarViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 24/06/2025.
//

import Foundation
import NavigateCoordinator

protocol TabBarViewControllerFactory {
    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> TabBarViewController<HomeTabBarView>
}

extension DependencyContainer: TabBarViewControllerFactory {

    func makeTabBar(tabBarNavigationDelegate: TabBarNavigationDelegate, onDismissed: (() -> Void)?) -> TabBarViewController<HomeTabBarView> {
        let tabBarView = HomeTabBarView()
        let TabBarViewController = TabBarViewController(view: tabBarView)
        TabBarViewController.onDismissed = onDismissed
        return TabBarViewController
    }
}
