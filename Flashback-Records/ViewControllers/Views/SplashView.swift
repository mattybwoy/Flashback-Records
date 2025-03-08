//
//  SplashView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/03/2025.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        Image("FlashbackRecordsVinyl")
            .resizable()
            .frame(width: 300, height: 300)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0), anchor: .center)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                        isAnimating = true
                    }
                }
            }
    }
    
}
