//
//  WishlistViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 01/03/2025.
//
import SwiftUI
import NavigateCoordinator

final class WishlistViewController<T: WishlistScreenInterface>: BasicViewController {

    private var wishlistView: T
    
    init(view: T) {
        self.wishlistView = view
        super.init()
    }
    
    override func viewDidLoad() {
        setupWishlistView()
        super.viewDidLoad()
    }
    
    private func setupWishlistView() {
        let controller = UIHostingController(rootView: wishlistView.wishlistView)
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

