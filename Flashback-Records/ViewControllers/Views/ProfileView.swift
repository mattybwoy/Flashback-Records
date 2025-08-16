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
    
    var profileView: some View {
        self
    }
    
    var body: some View {
        Text("Profile")
        Color.purple
    }
}

#Preview {
    ProfileView()
}
