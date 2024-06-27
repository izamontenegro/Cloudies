//
//  CriacaoView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 16/06/24.
//

import SwiftUI

struct CriacaoView: View {
    var body: some View {
        ScrollView {
        VStack {
            Image("criacaoiluss")
                .padding(.bottom, -20)
                VStack(spacing: -45) {
                    NavigationLink(destination: CriarProjetoView(ferramenta: "BrainStorm", imagem: "BrainStorm", cor: "AZUL")) {
                        CardsCriacao(
                            cor: "AZUL",
                            texto: """
                            Essa técnica criativa é usada para gerar ideias. Com auxílio da nuvem, você terá acesso a novas sugestões a partir de um tema escolhido no contexto do projeto.
                            """,
                            titulo: "Brainstorm",
                            espaco: 55
                        )
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: CriarProjetoView(ferramenta: "Problemas", imagem: "Problemas", cor: "AMARELO")) {
                        CardsCriacao(
                            cor: "AMARELO",
                            texto: """
                        Aqui você poderá entender melhor as problemáticas acerca do tema abordado. Utilize para compreender tópicos que podem ser resolvidos ou melhorados.
                        """,
                            titulo: "Problemáticas",
                            espaco: 55
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: CriarProjetoView(ferramenta: "Conexoes", imagem: "Conexao", cor: "ROSA")) {
                        CardsCriacao(
                            cor: "ROSA",
                            texto: """
                        Permite que você estabeleça conexões a partir de possiveis soluções. Ferramenta importante no pensamento divergente e expansão de possibilidades.
                        """,
                            titulo: "Conexões",
                            espaco: 10
                        )
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .shadow(radius: 7)
            }
        }
        .navigationTitle("Criação")
        .navigationBarTitleDisplayMode(.large)
    }
}

//#Preview {
//    CriacaoView()
//}
