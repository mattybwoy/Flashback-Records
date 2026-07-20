//
//  WishlistViewModel.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 17/07/2026.
//
import SwiftUI

protocol WishlistScreenNavigationDelegate: AnyObject {
    func searchTapped()
    
}

@MainActor
final class WishlistViewModel: ObservableObject {
    
    @Published var userState: UserState = .notLoggedIn
    let navigationDelegate: WishlistScreenNavigationDelegate
    
    init(
        navigationDelegate: WishlistScreenNavigationDelegate
    ) {
        self.navigationDelegate = navigationDelegate
        userState = .notLoggedIn
    }
    
    func searchTapped() {
        navigationDelegate.searchTapped()
    }
}
