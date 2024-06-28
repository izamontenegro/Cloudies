//
//  sheetAdicionarTextos.swift
//  Cloudies
//
//  Created by Yago Souza Ramos on 27/06/24.
//

import SwiftUI

struct SheetAdicionarTextos: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var linhaGeracao: [LinhaDePalavras]
    @State private var palavras: [Palavra] = [Palavra(texto: ""), Palavra(texto: "")]
    @State var ferramenta: String = "Problemas"
    @State var cor: String = "AMARELO"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    switch ferramenta {
                    case "Problemas":
                        Image("TEXTOPROBLEMA")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 526.06)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                    case "Conexao":
                        Image("TEXTOCONEXAO")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 556.95)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                    default:
                        Image("")
                    }
                    
                    Spacer()
                    ForEach($palavras.indices, id: \.self) { i in
                        VStack {
                            if i == 0 {
                                Text("Destaque")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.leading, -178)
                                    .padding(.bottom, -5)
                            } else {
                                Text("Texto")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.leading, -178)
                                    .padding(.bottom, -5)
                            }
                            
                            TextField("\(i == 0 ? "Titulo" : "Texto")", text: $palavras[i].texto)
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
                        for i in palavras.indices {
                            palavras[i].isFromUser.toggle()
                        }
                        
                        linhaGeracao.append(LinhaDePalavras(palavras: palavras))
                        
                        dismiss()
                        
                    }, label: {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 357, height: 63)
                                .foregroundStyle(Color(cor))
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
            }.defaultScrollAnchor(.bottom)
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

//#Preview {
//    SheetAdicionarTextos(linhaGeracao: <#Binding<[LinhaDePalavras]>#>)
//}
