//
//  AccountCreationViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 26/06/2026.
//

import SwiftUI
import NavigateCoordinator

final class AccountCreationViewController<T: AccountCreationScreenInterface>: BasicViewController {

    private var accountCreationView: T

    init(view: T) {
        self.accountCreationView = view
        super.init()
    }

    override func viewDidLoad() {
        setupAccountCreationView()
        super.viewDidLoad()
    }

    private func setupAccountCreationView() {
        let controller = UIHostingController(rootView: accountCreationView.accountCreationView)
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
