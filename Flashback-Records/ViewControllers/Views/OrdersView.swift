//
//  OrderView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/08/2025.
//

import SwiftUI

protocol OrderScreenInterface {
    associatedtype ViewType: View
    var orderView: ViewType { get }
}

struct OrderView: View, OrderScreenInterface {
    
    var orderView: some View {
        self
    }
    
    var body: some View {
        Text("Order")
        Color.blue
    }
}

#Preview {
    OrderView()
}
