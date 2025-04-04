//
//  BasicNavigator.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 25/03/2025.
//
import UIKit
import SwiftUI

public final class BasicNavigator {
    
    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func push<V: View>(_ view: V) {
        navigationController.pushViewController(UIHostingController(rootView: view), animated: true)
    }
    
}
