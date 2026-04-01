//
//  SplashScreenViewModel.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 18/05/2025.
//

import Foundation

protocol SplashScreenNavigationDelegate: AnyObject {
    func initializeHomeTabBar()
}

struct SplashScreenViewModel {
    let navigationDelegate: SplashScreenNavigationDelegate
    
    func navigateToHomeTabBar() {
        navigationDelegate.initializeHomeTabBar()
    }
}
