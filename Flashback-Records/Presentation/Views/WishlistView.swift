//
//  WishlistView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/08/2025.
//
import SwiftUI

class MockWishlistScreenNavigationDelegate: WishlistScreenNavigationDelegate {
    func searchTapped() {}
}

struct WishlistView: View {
    
    var viewModel: WishlistViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Text("WISHLIST")
                .font(.appTitle)
            
            HStack {
                Text("0 saved records")
                    .font(.appBody)
                Spacer()
            }
            .padding(.horizontal, 16)
            
            Spacer()
            Image(systemName: "heart")
                .resizable()
                .frame(width: 30, height: 30)
            Text("No items in your wishlist")
                .font(.appBody)
            Button {
                viewModel.searchTapped()
            } label: {
                Text("Browse store")
                    .font(.appBody)
            }
            Spacer()
        }
        Spacer()
    }
}

#Preview {
    WishlistView(viewModel: .init(navigationDelegate: MockWishlistScreenNavigationDelegate()))
}
