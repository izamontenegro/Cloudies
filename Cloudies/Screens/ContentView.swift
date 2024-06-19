//
//  ContentView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 11/06/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            NavigationStack {
                CriacaoView()
            }
            .navigationTitle("Criação")
            .tabItem {
                Label("Criação", systemImage: "cloud")
            }

            NavigationStack {
                HistoricoView()
            }
            .navigationTitle("Histórico")
            .tabItem {
                Label("Histórico", systemImage: "book")
            }

        }  
        .accentColor(.black)
        .background(.ultraThinMaterial)
                   
    }
}

#Preview {
    ContentView()
}
