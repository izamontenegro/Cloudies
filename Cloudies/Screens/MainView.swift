//
//  MainView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 22/06/24.
//

import SwiftUI

struct MainView: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    var body: some View {
        NavigationStack {
//                    Button(action: {
//                        isOnboardingComplete = false
//                    }) {
//                        Text("Redefinir Onboarding")
//                            .font(.footnote)
//                            .foregroundStyle(Color.black)
//                            .frame(width: 171, height: 28)
//                            .background(Color.white)
//                            .cornerRadius(7)
//                            .shadow(radius: 10)
//                    }
            TabView {
                NavigationView {
                    CriacaoView()
                        .navigationTitle("Criação")
                }
                .tabItem {
                    Label("Criação", systemImage: "cloud")
                }
                
                NavigationView {
                    HistoricoView()
                        .navigationTitle("Histórico")
                }
                .tabItem {
                    Label("Histórico", systemImage: "book")
                }
                
            }
            .accentColor(.black)
            .background(.ultraThinMaterial)
            
        }
    }
}

#Preview {
    MainView()
}
