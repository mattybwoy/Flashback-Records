//
//  SearchView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/08/2025.
//

import SwiftUI

protocol SearchScreenInterface {
    associatedtype ViewType: View
    var searchView: ViewType { get }
}

struct SearchView: View, SearchScreenInterface {
    
    var searchView: some View {
        self
    }
    
    @State var searchTerm: String = ""
    
    var body: some View {
        VStack(spacing: 12) {
            Text("SEARCH")
                .font(.appTitle)
            
            HStack {
                TextField("Search", text: $searchTerm)
                    .font(.appTitle)
                    .tint(.black)
                Image(systemName: "magnifyingglass")
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black))
            .shadow(color: .black.opacity(0.5), radius: 12, x: 0, y: 2)
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
            }
            LazyVGrid(columns: [.init()], spacing: 12) {
                
            }
        }
    }
}

@ViewBuilder func recordInfo(for record: Record) -> some View {
    
}

#Preview {
    SearchView()
}
