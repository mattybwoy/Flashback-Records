//
//  TabBarNavigationDelegate.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 24/06/2025.
//

protocol TabBarNavigationDelegate: AnyObject {
    func navigateToWishlist()
    func navigateToSearch()
    func navigateToOrders()
    func navigateToProfile()
}
