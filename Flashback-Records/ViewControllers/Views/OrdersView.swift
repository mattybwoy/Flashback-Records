//
//  OrdersView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/08/2025.
//

import SwiftUI

protocol OrdersScreenInterface {
    associatedtype ViewType: View
    var orderView: ViewType { get }
}

struct OrderView: View, OrdersScreenInterface {
    
    var orderView: some View {
        self
    }
    
    var body: some View {
        Text("Orders")
        Color.blue
    }
}

#Preview {
    OrderView()
}
