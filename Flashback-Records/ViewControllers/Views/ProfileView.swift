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

        Spacer()
        
        VStack(spacing: 12) {
            Button {
                //Action to open Modal sign in view
            } label: {
                Text("Sign In")
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
            
            Text("Be the first to know about new collections and receive email-only discounts.")
            
            TextField("Email", text: $email)
            
            Button("Subscribe") {
                // Action to subscribe to newsletter
            }
            
        }
        .padding(24)
        
        VStack(spacing: 4) {
            Link("Privacy Policy", destination: URL(string: "https://flashback.co.uk/policies/privacy-policy")!)
                .font(.title)
                .foregroundStyle(.red)
            Link("Returns Policy", destination: URL(string: "https://flashback.co.uk/pages/returns-policy")!)
                .font(.title)
                .foregroundStyle(.red)
            Link("Shipping Policy", destination: URL(string: "https://flashback.co.uk/pages/shipping-policy")!)
                .font(.title)
                .foregroundStyle(.red)
            Link("Contact Us", destination: URL(string: "https://flashback.co.uk/pages/contact-us")!)
                .font(.title)
                .foregroundStyle(.red)
            Link("About Us", destination: URL(string: "https://flashback.co.uk/pages/about-us")!)
                .font(.title)
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    ProfileView()
}
