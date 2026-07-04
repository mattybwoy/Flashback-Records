//
//  AccountLoginViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 04/07/2026.
//

import SwiftUI
import NavigateCoordinator

final class AccountLoginViewController<T: View>: BasicViewController {

    private var accountLoginView: T

    init(view: T) {
        self.accountLoginView = view
        super.init()
    }

    override func viewDidLoad() {
        setupAccountLoginView()
        super.viewDidLoad()
    }

    private func setupAccountLoginView() {
        let controller = UIHostingController(rootView: accountLoginView)
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
