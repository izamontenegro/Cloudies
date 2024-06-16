//
//  ContentView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 11/06/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            NavigationStack {
                CriacaoView()
            }
            .tabItem {
                Label("Criação", systemImage: "cloud")
            }

            NavigationStack {
                Historico()
            }
            .tabItem {
                Label("Histórico", systemImage: "book")
            }

        }
        .accentColor(.black)
        .onAppear {
            UITabBar.appearance().backgroundColor = .systemGray6
        }
        
    }
}

#Preview {
    ContentView()
}
