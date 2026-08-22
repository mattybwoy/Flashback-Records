//
//  AccountCreationView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 26/06/2026.
//

import SwiftUI

class MockAccountCreationScreenNavigationDelegate: AccountCreationScreenNavigationDelegate {
    func returnToProfileScreen() {}
    func navigateToLoginScreen() {}
}

struct AccountCreationView: View {
    var viewModel: AccountCreationViewModel
    @State var name: String = ""
    @State var emailAddress: String = ""
    @State var password: String = ""

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
        
        HStack {
            Spacer()
            Text("Already a member?")
                .font(.appBody)
            Button {
                viewModel.didTappedSignIn()
            } label: {
                Text("Log in")
                    .font(.appBody)
                    .foregroundStyle(Color.primary)
                    .underline(true)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 32)
        
        Spacer()
        
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Name")
                        .font(.appBody)
                        .padding(.horizontal, 16)
                    TextField("", text: $name)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black))
                        .shadow(color: .black.opacity(0.5), radius: 12, x: 0, y: 2)
                        .padding(.horizontal, 16)
                }
            }
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email Address")
                        .font(.appBody)
                        .padding(.horizontal, 16)
                    TextField("", text: $emailAddress)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black))
                        .shadow(color: .black.opacity(0.5), radius: 12, x: 0, y: 2)
                        .padding(.horizontal, 16)
                }
            }
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
            
            Text("By creating an account, you agree to our Terms of Service and Privacy Policy.")
                .font(.appSubtitle)
                .padding(.vertical, 16)
            
            Button {
                viewModel.didTappedSignIn()
            } label: {
                Text("Create Account")
                    .font(.appBody)
                    .foregroundStyle(Color.white)
            }
            .padding(16)
            .background(Color.black)
            .cornerRadius(4)
        }
        .padding(16)
        
        Spacer()
        Spacer()
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
