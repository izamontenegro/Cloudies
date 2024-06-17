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
                VStack(spacing: -45) {
                    CardsCriacao(
                        cor: "AZUL",
                        texto: """
Explicação: Lorem ipsum dolor sit amet consectetur. Natoque vestibulum sapien in sollicitudin mattis. Tellus malesuada scelerisque dui donec commodo .
""",
                        titulo: "Brainstorm",
                        espaco: 55
                    )
                    
                    CardsCriacao(
                        cor: "AMARELO",
                        texto: """
Explicação: Lorem ipsum dolor sit amet consectetur. Natoque vestibulum sapien in sollicitudin mattis. Tellus malesuada scelerisque dui donec commodo .
""",
                        titulo: "Problemáticas",
                        espaco: 55
                    )
                    
                    CardsCriacao(
                        cor: "ROSA",
                        texto: """
Explicação: Lorem ipsum dolor sit amet consectetur. Natoque vestibulum sapien in sollicitudin mattis. Tellus malesuada scelerisque dui donec commodo .
""",
                        titulo: "Analogia",
                        espaco: 20
                    )
                }
                .padding(.top, 21)
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
