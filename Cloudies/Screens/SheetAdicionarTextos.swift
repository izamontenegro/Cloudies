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
    
    var body: some View {
        ForEach($palavras.indices, id: \.self) { i in
            TextField("\(i == 0 ? "Titulo" : "Texto")", text: $palavras[i].texto)
        }
        
        Button("Enviar") {
            
            for i in palavras.indices {
                palavras[i].isFromUser.toggle()
            }
            
            linhaGeracao.append(LinhaDePalavras(palavras: palavras))
            
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
    
}

//#Preview {
//    sheetAdicionarTextos()
//}
