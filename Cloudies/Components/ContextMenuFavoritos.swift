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
            Text("\(essaPalavra.texto)")
                .background(essaPalavra.isFavorite ? .AZUL : .white)
                .frame(width: .infinity)
                .presentationCornerRadius(20)
        }

    }
}
