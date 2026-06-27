//
//  AccountCreationView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 26/06/2026.
//

import SwiftUI

protocol AccountCreationScreenInterface {
    associatedtype ViewType: View
    var accountCreationView: ViewType { get }
}

struct AccountCreationView: View, AccountCreationScreenInterface {

    var accountCreationView: some View {
        self
    }
    
    var body: some View {
        Text("Create Account")
            .font(.appTitle)
        Color.yellow
    }
}

#Preview {
    AccountCreationView()
}
