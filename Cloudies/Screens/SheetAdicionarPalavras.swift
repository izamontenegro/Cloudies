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
        VStack {
            ForEach($palavras.indices, id: \.self) { i in
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $palavras[i].texto)
            }
        }
        Button("Press to send") {
            palavras.removeAll { palavra in
                palavra.texto == ""
            }
            
            for i in palavras.indices {
                palavras[i].isFromUser = true
            }
            
            linhaGeracao.append(LinhaDePalavras(palavras: palavras))
            
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}

