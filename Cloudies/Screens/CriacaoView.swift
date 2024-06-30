//
//  CriacaoView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 16/06/24.
//

import SwiftUI
import SwiftData
struct CriacaoView: View {
    @State var navigationPath: NavigationPath = NavigationPath()
    @State var brainstorm: GeracaoData = GeracaoData()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
        ScrollView {
            VStack {
                Image("criacaoiluss")
                    .padding(.bottom, -20)
                VStack(spacing: -45) {
                    Button {
                        navigationPath.append("TelaCriacao")
                        print(navigationPath)
                    } label: {
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
                    
                    NavigationLink(destination: CriarProjetoView(navigationPath: $navigationPath, ferramenta: "Problemas", imagem: "Problemas", cor: "AMARELO", brainstorm: $brainstorm)) {
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
                    
                    NavigationLink(destination: CriarProjetoView(navigationPath: $navigationPath, ferramenta: "Conexoes", imagem: "Conexao", cor: "ROSA", brainstorm: $brainstorm)) {
                        CardsCriacao(
                            cor: "ROSA",
                            texto: """
                        Permite que você estabeleça conexões a partir de possiveis soluções. Ferramenta importante no pensamento divergente e expansão de possibilidades.
                        """,
                            titulo: "Conexões",
                            espaco: 10
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
                Text("Alimentado pela API do Gemini")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.top, 15)
            }
            .navigationDestination(for: String.self) { name in
                switch name {
                case "BrainStorm":
                    TelaBrainStorm(brainstorm: $brainstorm, navigationPath: $navigationPath)
                case "TelaCriacao":
                    CriarProjetoView(navigationPath: $navigationPath, ferramenta: "BrainStorm", imagem: "BrainStorm", cor: "AZUL", brainstorm: $brainstorm)
                case "Problemas":
                    ProblemasView(modelo: $brainstorm, navigationPath: $navigationPath)
                case "Conexoes":
                    ProblemasView(modelo: $brainstorm, navigationPath: $navigationPath)
                default:
                    Color.red
                }
            }
        }
                
        }
        .navigationTitle("Criação")
        .navigationBarTitleDisplayMode(.large)
    }
}

//#Preview {
//    CriacaoView()
//}
