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
                Criar()
            }
            .navigationTitle("Criação")
            .tabItem {
                Label("Criação", systemImage: "cloud")
            }

            NavigationStack {
                Historico()
            }
            .navigationTitle("Histórico")
            .tabItem {
                Label("Histórico", systemImage: "book")
            }

        }  .accentColor(.black)
    }
}

#Preview {
    ContentView()
}
