//
//  ProfileView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/08/2025.
//

import SwiftUI

class MockAuthenticationRepository: AuthenticationRepository {
    func login(username: String, password: String) async throws -> User? { nil }
    func signUp(username: String, password: String) async throws -> User? { nil }
}

protocol ProfileScreenInterface {
    associatedtype ViewType: View
    var profileView: ViewType { get }
    var viewModel: ProfileScreenViewModel { get set }
}

struct ProfileView: View, ProfileScreenInterface {
    
    @State private var email: String = ""
    @State private var subscribeAlertIsPresented: Bool = false
    
    var profileView: some View {
        self
    }
    
    var viewModel: ProfileScreenViewModel
    
    var body: some View {
        Image("Flashback Records LogoBlackBG")
            .resizable()
            .frame(width: 180, height: 100)
            .padding(.bottom, 40)
        
        VStack(spacing: 12) {
            Button {
                //Action to open Modal sign in view
            } label: {
                Text("SIGN IN")
                    .font(.appBody)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 36)
            .padding(.vertical, 16)
            .overlay(Rectangle()
                .stroke(Color.black, lineWidth: 4))
            .padding(.vertical, 8)
            
            Button {
                //Action to open Modal sign up view
            } label: {
                Text("SIGN UP")
                    .font(.appBody)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 36)
            .padding(.vertical, 14)
            .overlay(Rectangle()
                .stroke(Color.black, lineWidth: 4))
            .padding(.vertical, 8)
        }
        
        VStack(spacing: 12) {
            Text("Subscribe to our newsletter")
                .font(.appTitle)
            
            Text("Be the first to know about new collections and receive email-only discounts.")
                .font(.appBody)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .lineLimit(nil)

            
            TextField("Email", text: $email)
                .font(.appBody)
                .padding(.horizontal, 36)
                .padding(.vertical, 14)
                .overlay(Rectangle()
                    .stroke(Color.black, lineWidth: 4))
                .keyboardType(.emailAddress)
            
            Button {
                if email.isEmpty { subscribeAlertIsPresented = true }
                Task {
                    do {
                        try await viewModel.subscribeToNewsletter(email: $email.wrappedValue)
                    }
                    catch {
                        subscribeAlertIsPresented = true
                        print("Error subscribing to newsletter")
                    }
                }
            } label: {
                Text("SUBSCRIBE")
                    .font(.appBody)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 36)
            .padding(.vertical, 14)
            .overlay(Rectangle()
                .stroke(Color.black, lineWidth: 4))
            .padding(.vertical, 8)
            .alert("Error", isPresented: $subscribeAlertIsPresented) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Please enter a valid email address")
            }
        }
        .padding(20)
        
        VStack(spacing: 4) {
            Link("Privacy Policy", destination: URL(string: "https://flashback.co.uk/policies/privacy-policy")!)
                .font(.appBody)
                .foregroundStyle(.black)
            Link("Returns Policy", destination: URL(string: "https://flashback.co.uk/pages/returns-policy")!)
                .font(.appBody)
                .foregroundStyle(.black)
            Link("Shipping Policy", destination: URL(string: "https://flashback.co.uk/pages/shipping-policy")!)
                .font(.appBody)
                .foregroundStyle(.black)
            Link("Contact Us", destination: URL(string: "https://flashback.co.uk/pages/contact-us")!)
                .font(.appBody)
                .foregroundStyle(.black)
            Link("About Us", destination: URL(string: "https://flashback.co.uk/pages/about-us")!)
                .font(.appBody)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    ProfileView(
        viewModel: ProfileScreenViewModel(
            loginUseCase: .init(authenticationService: MockAuthenticationRepository()),
            signUpUseCase: SignUpUseCase(authenticationService: MockAuthenticationRepository()),
            subscribeNewsletterUseCase: SubscribeNewsletterUseCase(authenticationService: MockAuthenticationRepository())
        )
    )
}
