//
//  SheetAdicionarPalavras.swift
//  Cloudies
//
//  Created by Yago Souza Ramos on 27/06/24.
//

import SwiftUI

struct SheetAdicionarPalavras: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var linhaGeracao: [LinhaDePalavras]
    @State private var palavras: [Palavra] = [Palavra(texto: ""), Palavra(texto: ""), Palavra(texto: ""), Palavra(texto: ""), Palavra(texto: "")]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("imagemBrainstorm")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 276.48)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    VStack {
                        ForEach($palavras.indices, id: \.self) { i in
                            Text("Ideia \(i+1)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.leading, -178)
                                .padding(.bottom, -5)
                            TextField("Digite sua ideia...", text: $palavras[i].texto)
                                .padding()
                                .frame(width: 357, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                        .frame(width: 357, height: 39)
                                )
                        }
                    }
                   
                    Button(action: {
                        palavras.removeAll { palavra in
                            palavra.texto == ""
                        }
                        
                        for i in palavras.indices {
                            palavras[i].isFromUser = true
                        }
                        
                        linhaGeracao.append(LinhaDePalavras(palavras: palavras))
                        
                        dismiss()
                        
                    }, label: {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 357, height: 63)
                                .foregroundStyle(.AZUL)
                                .shadow(radius: 4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                        .frame(width: 357, height: 63)
                                )
                            
                            Text("Adicionar")
                                .font(.title2)
                        }
                    })
                    .padding(.top, 33)
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .defaultScrollAnchor(.bottom)
            .navigationTitle("Adicionar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Voltar") {
                        dismiss()
                    }
                    
                }
            }
        }
    }
}
