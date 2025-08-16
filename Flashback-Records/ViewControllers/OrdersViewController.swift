//
//  OrdersViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 03/03/2025.
//
import SwiftUI
import NavigateCoordinator

final class OrdersViewController<T: OrdersScreenInterface>: BasicViewController {

    private var orderView: T
    
    init(view: T) {
        self.orderView = view
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupOrderView() {
        let controller = UIHostingController(rootView: orderView.orderView)
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
