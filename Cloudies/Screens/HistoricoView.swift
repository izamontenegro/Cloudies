//
//  Historico.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/06/24.
//

import SwiftUI

struct HistoricoView: View {
    let projetos = ["My first APP", "AppStore Challenge", "CLI", "CBL", "MVP challenge"]
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            // Fazer a substituiçao por projeto.titulo e projeto.ferramenta em cor e titulo
            ForEach(searchResults, id: \.self) { projeto in
                NavigationLink {
                    Text("coisa")
                } label: {
                    CardsHistorico(cor: "AZUL", texto: "qualquer bosta", titulo: "Coisa")
                        .padding(.bottom, -35)
                }
                .buttonStyle(PlainButtonStyle())
                
            }
            .navigationTitle("Histórico")
            .shadow(radius: 5.6)
            .padding(.top, 20)
            .searchable(text: $searchText, prompt: "Procurando projetos hihihi")
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return projetos
        } else {
            return projetos.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    HistoricoView()
}
