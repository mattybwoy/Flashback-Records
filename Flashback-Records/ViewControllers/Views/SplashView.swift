//
//  SplashView.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/03/2025.
//

import SwiftUI

protocol SplashScreenInterface {
    associatedtype ViewType: View
    var splashScreenView: ViewType { get }
    var splashDelegate: SplashScreenDelegate? { get set }
}

protocol SplashScreenDelegate: AnyObject {
    func didFinishSplash()
}

struct SplashView: View, SplashScreenInterface {
    
    weak var splashDelegate: SplashScreenDelegate?
    
    var splashScreenView: some View {
        self
    }
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        Image("FlashbackRecordsVinyl")
            .resizable()
            .frame(width: 300, height: 300)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0), anchor: .center)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    splashDelegate?.didFinishSplash()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                        isAnimating = true
                    }
                }
            }
    }
    
}
