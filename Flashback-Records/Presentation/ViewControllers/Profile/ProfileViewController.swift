//
//  ProfileViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/03/2025.
//

import SwiftUI
import NavigateCoordinator

final class ProfileViewController<T: ProfileScreenInterface>: BasicViewController {

    private var profileView: T
    
    init(view: T) {
        self.profileView = view
        super.init()
    }
    
    override func viewDidLoad() {
        setupProfileView()
        super.viewDidLoad()
    }
    
    private func setupProfileView() {
//        let controller = UIHostingController(rootView: profileView.profileView)
//            addChild(controller)
//            controller.view.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview(controller.view)
//            controller.didMove(toParent: self)
        
//        // Instead of:
//        let controller = UIHostingController(rootView: profileView)
//        addChild(controller)
//        view.addSubview(controller.view)
//        controller.didMove(toParent: self)

        // Try:
        let hostingVC = UIHostingController(rootView: profileView.profileView)
        hostingVC.willMove(toParent: nil)
        addChild(hostingVC)
        hostingVC.view.frame = view.bounds
        view.addSubview(hostingVC.view)
        hostingVC.didMove(toParent: self)
        
            NSLayoutConstraint.activate([
                hostingVC.view.widthAnchor.constraint(equalTo: view.widthAnchor),
                hostingVC.view.heightAnchor.constraint(equalTo: view.heightAnchor),
                hostingVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                hostingVC.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}
