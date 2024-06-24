//
//  CriacaoView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 16/06/24.
//

import SwiftUI

struct CriacaoView: View {
    var body: some View {
        ScrollView {
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.thinMaterial)
                    .frame(width: 357.45, height: 143.71)
                    .padding(.top, 14)
                VStack(spacing: -45) {
                    NavigationLink(destination: CriarProjetoView()) {
                        CardsCriacao(
                            cor: "AZUL",
                            texto: """
                            Explicação: Lorem ipsum dolor sit amet consectetur. Natoque vestibulum sapien in sollicitudin mattis. Tellus malesuada scelerisque dui donec commodo .
                            """,
                            titulo: "Brainstorm",
                            espaco: 55
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: CriarProjetoView(ferramenta: "Problemáticas", cor: "AMARELO")) {
                        CardsCriacao(
                            cor: "AMARELO",
                            texto: """
                        Explicação: Lorem ipsum dolor sit amet consectetur. Natoque vestibulum sapien in sollicitudin mattis. Tellus malesuada scelerisque dui donec commodo .
                        """,
                            titulo: "Problemáticas",
                            espaco: 55
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: CriarProjetoView(ferramenta: "Conexões", cor: "ROSA")) {
                        CardsCriacao(
                            cor: "ROSA",
                            texto: """
                        Explicação: Lorem ipsum dolor sit amet consectetur. Natoque vestibulum sapien in sollicitudin mattis. Tellus malesuada scelerisque dui donec commodo .
                        """,
                            titulo: "Conexões",
                            espaco: 20
                        )
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .shadow(radius: 7)
                .padding(.top, 11)
            }
            
            .navigationTitle("Criação")
        }
    }
}

#Preview {
    NavigationStack {
        CriacaoView()
    }
    
}
