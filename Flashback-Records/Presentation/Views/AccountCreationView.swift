//
//  AccountCreationView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 26/06/2026.
//

import SwiftUI

class MockAccountCreationScreenNavigationDelegate: AccountCreationScreenNavigationDelegate {
    func returnToProfileScreen() {}
}

struct AccountCreationView: View {
    var viewModel: AccountCreationViewModel

    var body: some View {
        HStack {
            Button {
                viewModel.didTappedBack()
            } label: {
                Image(systemName: "arrowshape.backward.circle.fill")
                    .foregroundStyle(Color.black)
                    .font(.appTitle)
            }
            Spacer()
            Text("Create Account")
                .font(.appTitle)
                .padding(.trailing, 16)
            Spacer()
        }
        .padding(.horizontal, 16)
        Color.yellow
    }
}

#Preview {
    AccountCreationView(
        viewModel: AccountCreationViewModel(
            navigationDelegate: MockAccountCreationScreenNavigationDelegate(),
            signUpUseCase: SignUpUseCase(authenticationService: MockAuthenticationRepository())
        )
    )
}
