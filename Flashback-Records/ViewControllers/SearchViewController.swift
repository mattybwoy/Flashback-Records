//
//  SearchViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/03/2025.
//

import SwiftUI
import NavigateCoordinator

final class SearchViewController<T: SearchScreenInterface>: BasicViewController {

    private var searchView: T
    
    init(view: T) {
        self.searchView = view
        super.init()
    }
    
    override func viewDidLoad() {
        setupSearchView()
        super.viewDidLoad()
    }
    
    private func setupSearchView() {
        let controller = UIHostingController(rootView: searchView.searchView)
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
}
