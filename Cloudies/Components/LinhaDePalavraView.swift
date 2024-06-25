//
//  LinhaDePalavras.swift
//  testesChallenge5
//
//  Created by Yago Souza Ramos on 10/06/24.
//

import SwiftUI

struct Palavra: Identifiable, Codable, Hashable {
    var id: UUID? = UUID()
    var texto: String
    var isFavorite: Bool = false
    var isGeneration: Bool = false

}

struct LinhaDePalavras: Identifiable, Codable, Hashable  {
    var id: UUID? = UUID()
    var palavras: [Palavra]
    
}

struct LinhaDePalavrasView: View {
    
    @Binding
    var palavras: [Palavra]
    
    @Binding
    var linhas: [LinhaDePalavras]
    
    @Binding
    var observador: Bool
    
    func addLinha(novaLinha: LinhaDePalavras) {
        linhas.append(novaLinha)
    }
    
    var meio: Int { (palavras.count/2) }
    
    var body: some View {
        let primeiraMetade = $palavras[..<meio]
        let segundaMetade = $palavras[meio]
        let terceiraMetade = $palavras[(meio+1)...]
            VStack {
                
                HStack {
                    ForEach(primeiraMetade, id: \.id) { palavra in
                        
                        ContextMenuFavoritos(essaPalavra: palavra, observador: $observador)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.bottom, 10)
                HStack {
                    ContextMenuFavoritos(essaPalavra: segundaMetade, observador: $observador)
                        .foregroundStyle(.black)
                }
                
                .padding(.bottom, 10)
                
                HStack {
                    ForEach(terceiraMetade, id: \.id) { palavra in
                        
                        ContextMenuFavoritos(essaPalavra: palavra, observador: $observador)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.bottom, 10)
            }
        
            }
    } 

    /*
    var body: some View {
    let primeiraMetade = $palavras[..<meio]
    let segundaMetade = $palavras[meio...]
    VStack {
    HStack {
    ForEach(segundaMetade, id: \.id) { palavra in

    ContextMenuFavoritos(essaPalavra: palavra, observador: $observador)
    .frame(width: .infinity)
    .foregroundStyle(.black)
    Text("")
    }
    }
    HStack {
    ForEach(primeiraMetade, id: \.id) { palavra in

    ContextMenuFavoritos(essaPalavra: palavra, observador: $observador)
    .frame(width: .infinity)
    .foregroundStyle(.black)
    Text("")
    }
    }
    }
    }
    */
//}
#Preview {
    NavigationStack {
        TelaBrainStorm(titulo: "", palavraEntrada: "bar", recorteTematico: "musicas")
    }
}
