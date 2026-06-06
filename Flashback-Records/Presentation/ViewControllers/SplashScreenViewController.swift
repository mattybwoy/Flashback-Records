//
//  SplashScreenViewController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/03/2025.
//
import SwiftUI
import NavigateCoordinator

final class SplashScreenViewController<T: SplashScreenInterface>: BasicViewController {
    
    private var splashScreenView: T
    
    init(view: T) {
        self.splashScreenView = view
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSplashView()
    }
    
    private func setupSplashView() {
        let controller = UIHostingController(rootView: splashScreenView.splashScreenView)
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
