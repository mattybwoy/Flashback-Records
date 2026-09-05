//
//  AccountLoginView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 04/07/2026.
//

import SwiftUI

class MockAccountLoginScreenNavigationDelegate: AccountLoginScreenNavigationDelegate {
    func navigateToAccountCreationScreen() {}
    func returnToProfileScreen() {}
}

struct AccountLoginView: View {
    var viewModel: AccountLoginViewModel
    
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var alertIsPresented: Bool = false

    var body: some View {
        HStack(spacing: 0) {
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
        .padding(8)
        
        HStack(spacing: 2) {
            Spacer()
            Text("Don't have an account create one")
                .font(.appSubtitle)
            Button {
                viewModel.didTappedAccountCreationScreen()
            } label: {
                Text("here")
                    .font(.appSubtitle)
                    .foregroundStyle(Color.primary)
                    .underline(true)
            }
        }
        .padding(.horizontal, 16)

        
        Spacer()
        
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Email Address")
                    .font(.appBody)
                    .padding(.horizontal, 16)
                TextField("", text: $emailAddress)
                    .keyboardType(.emailAddress)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black))
                    .shadow(color: .black.opacity(0.5), radius: 12, x: 0, y: 2)
                    .padding(.horizontal, 16)
            }
        }
        .padding(.horizontal, 16)
        
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Password")
                    .font(.appBody)
                    .padding(.horizontal, 16)
                SecureField("", text: $password)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black))
                    .shadow(color: .black.opacity(0.5), radius: 12, x: 0, y: 2)
                    .padding(.horizontal, 16)
            }
        }
        .padding(.horizontal, 16)
        
        Text("By creating an account, you agree to our Terms of Service and Privacy Policy.")
            .font(.appSubtitle)
            .padding(16)
        
        Button {
            if emailAddress.isEmpty || password.isEmpty {
                alertIsPresented.toggle()
            }
            Task {
                do {
                    try await viewModel.login(email: $emailAddress.wrappedValue, password: $password.wrappedValue)
                } catch {
                    alertIsPresented = true
                }
            }
        } label: {
            Text("Log in")
                .font(.appBody)
                .foregroundStyle(Color.white)
        }
        .padding(16)
        .background(Color.black)
        .cornerRadius(4)
        .alert("Error", isPresented: $alertIsPresented) {
            Button("OK", role: .cancel) {}
        } message: {
            if emailAddress.isEmpty || password.isEmpty {
                Text("Please fill in all required fields")
            }
        }
        
        Spacer()
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
