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
        TextField("Search", text: $searchTerm)
            .font(.appTitle)
        Color.green
    }
}

#Preview {
    SearchView()
}
