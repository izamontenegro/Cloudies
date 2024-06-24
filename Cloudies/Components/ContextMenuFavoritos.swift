//
//  ContextMenuFavoritos.swift
//  Cloudies
//
//  Created by Yago Souza Ramos on 19/06/24.
//

import SwiftUI

struct ContextMenuFavoritos: View {
    @Binding var essaPalavra: Palavra
    @Binding var observador: Bool
    var body: some View {
        Menu {
            Button {
                essaPalavra.isFavorite.toggle()
            } label: {
                Label("Favoritos", systemImage: essaPalavra.isFavorite ? "star.fill" : "star")
            }
            
            Button {
                essaPalavra.isGeneration.toggle()
                observador.toggle()
            } label: {
                Label("Gerar Novos", systemImage: essaPalavra.isGeneration ? "bolt.fill" : "bolt")
            }
            
        } label: {
            ZStack {
                Text("\(essaPalavra.texto)")
                    .presentationCornerRadius(20)
                    .padding(5)
                    .background {
                        if essaPalavra.isFavorite {
                            RoundedRectangle(cornerRadius: 180.0)
                                .foregroundStyle(.AZUL)
                        }
                    }
            }
        }

    }
}

#Preview {
    NavigationStack {
        TelaBrainStorm(titulo: "codigo", palavraEntrada: "pneumoultramicroscopicosilicovulcanoconiotico", recorteTematico: "Outras palavras Longas")
    }
}
