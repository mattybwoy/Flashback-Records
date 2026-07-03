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
    var viewModel: AccountCreationViewModel { get set }
}

struct AccountCreationView: View, AccountCreationScreenInterface {
    var viewModel: AccountCreationViewModel
    
    var accountCreationView: some View {
        self
    }
    
    var body: some View {
        HStack {
            Button {
                viewModel.didTappedBack()
            } label: {
                Image(systemName: "arrowshape.backward.circle.fill")
            }
            Spacer()
            Text("Create Account")
                .font(.appTitle)
            Spacer()
        }
        Color.yellow
    }
}

//#Preview {
//    AccountCreationView(viewModel: )
//}
