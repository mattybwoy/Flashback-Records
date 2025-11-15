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
    
    var body: some View {
        Text("SEARCH")
            .font(.appTitle)
        Color.green
    }
}

#Preview {
    SearchView()
}
