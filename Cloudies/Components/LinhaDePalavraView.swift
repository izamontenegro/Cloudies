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
        let meio: Int = (palavras.count/2)
        
        let primeiraMetade = palavras[..<meio]
        let segundaMetade = palavras[meio...]
        VStack {
            HStack {
                ForEach(primeiraMetade, id: \.id) { palavra in
                    
                    ContextMenuFavoritos(essaPalavra: palavra)
                        .frame(width: .infinity)
                        .foregroundStyle(.black)
                    Text("")
                    
                }
            }
            HStack {
                ForEach(segundaMetade, id: \.id) { palavra in
                    
                    ContextMenuFavoritos(essaPalavra: palavra)
                        .frame(width: .infinity)
                        .foregroundStyle(.black)
                    Text("")
                }
            }
        }
    }
}
