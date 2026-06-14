//
//  SplashViewModel.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 18/05/2025.
//

import Foundation

struct SplashViewModel {
    let navigationDelegate: SplashNavigationDelegate
    
    func navigateToHomeTabBar() {
        navigationDelegate.initializeHomeTabBar()
    }
}
