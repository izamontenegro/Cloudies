//
//  LinhaDePalavras.swift
//  testesChallenge5
//
//  Created by Yago Souza Ramos on 10/06/24.
//

import SwiftUI

struct Palavra: Identifiable {
    var id: UUID? = UUID()
    var texto: String
    var isFavorite: Bool = false
    
}

struct LinhaDePalavras: Identifiable {
    var id: UUID? = UUID()
    var palavras: [Palavra]
    
}

struct LinhaDePalavrasView: View {
    
    @Binding
    var palavras: [Palavra]
    
    @Binding
    var linhas: [LinhaDePalavras]
    
    func addLinha(novaLinha: LinhaDePalavras) {
        linhas.append(novaLinha)
    }
    var body: some View {
        HStack {
            ForEach(palavras, id: \.id) { palavra in
                Button {
                    linhas.append(linhas.last!)
                } label: {
                    Text(palavra.texto)
                }
                .foregroundStyle(.black)
            }
        }
        
    }
}
