//
//  ProfileView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 09/08/2025.
//

import SwiftUI

protocol ProfileScreenInterface {
    associatedtype ViewType: View
    var profileView: ViewType { get }
}

struct ProfileView: View, ProfileScreenInterface {
    
    @State private var email: String = ""
    
    var profileView: some View {
        self
    }
    
    var body: some View {
        Text("PROFILE")
            .font(.appTitle)
            .padding(.bottom, 24)
        
        VStack(spacing: 12) {
            Button {
                //Action to open Modal sign in view
            } label: {
                Text("Sign In")
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
                Text("Sign Up")
                    .font(.appBody)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 36)
            .padding(.vertical, 14)
            .overlay(Rectangle()
                .stroke(Color.black, lineWidth: 4))
            .padding(.vertical, 8)
        }
        
        Spacer()
        
        VStack(spacing: 12) {
            Text("Subscribe to our newsletter")
                .font(.appTitle)
            
            Text("Be the first to know about new collections and receive email-only discounts.")
                .font(.appBody)
                .multilineTextAlignment(.center)
        
            TextField("Email", text: $email)
                .padding(.horizontal, 36)
                .padding(.vertical, 14)
                .overlay(Rectangle()
                    .stroke(Color.black, lineWidth: 4))
                .keyboardType(.emailAddress)
            
            Button {
                //Action to subscribe to newsletter
            } label: {
                Text("Subscribe")
                    .font(.appBody)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 36)
            .padding(.vertical, 14)
            .overlay(Rectangle()
                .stroke(Color.black, lineWidth: 4))
            .padding(.vertical, 8)
        }
        .padding(24)
        
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
    ProfileView()
}
