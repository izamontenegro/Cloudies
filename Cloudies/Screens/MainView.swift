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
        TabView {
            NavigationStack {
                CriacaoView()
            }
            .tabItem {
                Label("Criação", systemImage: "cloud")
            }
            .accessibilityLabel("Criação")
            NavigationStack {
                HistoricoView()
            }
            .tabItem {
                Label("Histórico", systemImage: "book")
            }
            .accessibilityLabel("Histórico")
            
        }
        .accentColor(.black)
        .background(.ultraThinMaterial)
        
    }
}

#Preview {
    MainView()
}
