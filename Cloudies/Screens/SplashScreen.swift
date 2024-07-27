//
//  SplashScreen.swift
//  Cloudies
//
//  Created by Yago Souza Ramos on 01/07/24.
//

import SwiftUI

struct SplashScreen: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    @State var isActive: Bool = false
    @State private var posicao: CGFloat = 1
    @State private var tempoAnimacao: CGFloat = 1.4
    var body: some View {
        ZStack {
            if self.isActive {
                if isOnboardingComplete == true {
                    MainView()
                    
                } else {
                    OnBoardinggComeco()
                }
            } else {
                ZStack {
                    Color(isOnboardingComplete ? .VERMELHO : .AZUL)
                        .ignoresSafeArea()
                    Image("iconSplash")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                        .offset(CGSize(width: 10.0, height: posicao))
                        
                }
                .onAppear {
                    
                    withAnimation(.easeOut(duration: 0.5 * tempoAnimacao)) {
                        posicao = 100
                    }
                    withAnimation(.easeInOut(duration: 1.0 * tempoAnimacao).delay(0.3 * tempoAnimacao)) {
                        posicao = -3000
                    }
                    withAnimation(.easeInOut(duration: 1.0 * tempoAnimacao).delay(0.7 * tempoAnimacao)) {
                        isActive = true
                    }
                }
            }
        }    }
}

#Preview {
    SplashScreen(isActive: false)
}
