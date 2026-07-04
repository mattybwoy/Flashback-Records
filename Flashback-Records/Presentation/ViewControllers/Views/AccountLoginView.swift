//
//  AccountLoginView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 04/07/2026.
//

import SwiftUI

class MockAccountLoginScreenNavigationDelegate: AccountLoginScreenNavigationDelegate {
    func returnToProfileScreen() {}
}

struct AccountLoginView: View {
    var viewModel: AccountLoginViewModel

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
            Text("Log in")
                .font(.appTitle)
                .padding(.trailing, 16)
            Spacer()
        }
        .padding(.horizontal, 16)
        Color.yellow
    }
}

#Preview {
    AccountLoginView(
        viewModel: AccountLoginViewModel(
            navigationDelegate: MockAccountLoginScreenNavigationDelegate(),
            loginUseCase: LogInUseCase(authenticationService: MockAuthenticationRepository())
        )
    )
}
