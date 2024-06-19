//
//  ContextMenuFavoritos.swift
//  Cloudies
//
//  Created by Yago Souza Ramos on 19/06/24.
//

import SwiftUI

struct ContextMenuFavoritos: View {
    @State
    var essaPalavra: Palavra
    
    var body: some View {
        Menu {
            Button {
                essaPalavra.isFavorite.toggle()
            } label: {
                Label("Favoritos", systemImage: essaPalavra.isFavorite ? "star.fill" : "star")
            }
            
            Button {
                // Gerar novos
            } label: {
                Label("Gerar Novos", systemImage: "bolt.fill")
            }
            
        } label: {
            Text("\(essaPalavra.texto)")
                .background(essaPalavra.isFavorite ? .blue : .white)
                .frame(width: .infinity)
        }

    }
}
