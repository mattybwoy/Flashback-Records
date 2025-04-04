//
//  BasicNavigationController.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 29/03/2025.
//

import UIKit

class BasicNavigationController: UINavigationController {
    
    public var onDismissed: (() -> Void)?
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override public init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        if isBeingDismissed {
            onDismissed?()
            onDismissed = nil
        }
        super.viewDidDisappear(animated)
    }
    
    deinit {
        onDismissed?()
        onDismissed = nil
    }
}
