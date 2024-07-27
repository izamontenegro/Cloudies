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
                Label("Favoritos", systemImage: essaPalavra.isFavorite ? "heart.fill" : "heart")
            }
            
            Button {
                essaPalavra.isGeneration.toggle()
                observador.toggle()
            } label: {
                Label("Gerar Novos", systemImage: essaPalavra.isGeneration ? "cloud.drizzle.fill" : "cloud.drizzle")
            }
            
        } label: {
            ZStack(alignment: .topTrailing) {
                ZStack {
                    Text("\(essaPalavra.texto)")
                        .frame(width: 114)
                        .padding(4)
                        .font(.title3)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(essaPalavra.texto.starts(with: "Erro:") ? .VERMELHO : .BRANCO))
                                .shadow(radius: 4)
                                
                            //editar aqui
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        }
                }
                if essaPalavra.isFavorite {
                    Image("favRosa")
                        .frame(maxWidth: 26, maxHeight: 29)
                        .offset(x: 10, y: -10)
                }
                
                if essaPalavra.isFromUser {
                    Image("inputRoxo")
                        .frame(maxWidth: 28, maxHeight: 25)
                        .offset(x: 10, y: 10)
                }
                
            }
            
        }

    }
}

//#Preview {
//    NavigationStack {
//        TelaBrainStorm(titulo: "Projeto animal", palavraEntrada: "Cachorro", recorteTematico: "domestico")
//    }
//}
