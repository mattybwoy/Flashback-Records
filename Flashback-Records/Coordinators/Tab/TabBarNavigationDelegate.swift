//
//  TabBarNavigationDelegate.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 24/06/2025.
//

import NavigateCoordinator

protocol TabBarNavigationDelegate: AnyObject {
    func navigateToSearchScreen()
    func navigateToProfileScreen()
}
