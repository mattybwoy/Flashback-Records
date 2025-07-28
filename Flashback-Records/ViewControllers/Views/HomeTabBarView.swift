//
//  HomeTabBarView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 21/07/2025.
//

import SwiftUI

protocol TabBarInterface {
    associatedtype ViewType: View
    var tabBarView: ViewType { get }
}

public struct HomeTabBarView: View, TabBarInterface {
    
    var tabBarView: some View {
        self
    }
    
    public var body: some View {
        Color.yellow
    }
}
