//
//  SearchViewControllerFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 16/06/2026.
//

import Foundation

protocol SearchViewControllerFactory {
    func makeSearchViewController(navigationDelegate: SearchNavigationDelegate, onDismissed: (() -> Void)?) -> SearchViewController<SearchView>
}

extension DependencyContainer: SearchViewControllerFactory {
    
    @MainActor
    func makeSearchViewController(navigationDelegate: SearchNavigationDelegate, onDismissed: (() -> Void)?) -> SearchViewController<SearchView> {
        let searchView = SearchView()
        let searchViewController = SearchViewController(view: searchView)
        searchViewController.onDismissed = onDismissed
        return searchViewController
    }
}
