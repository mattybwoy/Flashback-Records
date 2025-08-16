//
//  WishlistView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/08/2025.
//
import SwiftUI

protocol WishlistScreenInterface {
    associatedtype ViewType: View
    var wishlistView: ViewType { get }
}

struct WishlistView: View, WishlistScreenInterface {
    
    var wishlistView: some View {
        self
    }
    
    var body: some View {
        Text("Wishlist")
        Color.yellow
    }
}

#Preview {
    WishlistView()
}
