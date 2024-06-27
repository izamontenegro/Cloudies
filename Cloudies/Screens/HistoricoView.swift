//
//  Historico.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/06/24.
//
import SwiftUI
import SwiftData

struct HistoricoView: View {
    @Environment(\.modelContext) var modelContext
    @Query var geracoesData: [GeracaoData]
    @State var essaGeracao: GeracaoData = GeracaoData()
    
    let projetos = ["My first APP", "AppStore Challenge", "CLI", "CBL", "MVP challenge"]
    @State private var searchText = ""
    @State private var navegar = false
    var body: some View {
        ScrollView {
            // Fazer a substituiçao por projeto.titulo e projeto.ferramenta em cor e titulo
            ForEach(geracoesData, id: \.self) { geracao in
                Button {
                    essaGeracao = geracao
                    print(essaGeracao.palavraEntradaData)
                    navegar = true
                } label: {
                    CardsHistorico(
                        ferramenta: geracao.tipo,
                        texto: "\(geracao.palavrasGeradas)",
                        titulo: "\(geracao.tituloData)"
                    )
                    .padding(.bottom, -35)
                }
                
                
                
                .buttonStyle(PlainButtonStyle())
                .navigationTitle("Histórico")
                .shadow(radius: 5.6)
                .padding(.top, 20)
                .searchable(text: $searchText, prompt: "Procurando projetos hihihi")
            }
            .navigationTitle("Histórico")
            .navigationDestination(isPresented: $navegar) {
                
                switch essaGeracao.tipo {
                case "BrainStorm":
                    TelaBrainStorm(brainstorm: $essaGeracao)
                case "Problemas":
                    ProblemasView(modelo: $essaGeracao)
                case "Conexoes":
                    ProblemasView(modelo: $essaGeracao)
                default:
                    ProblemasView(modelo: $essaGeracao)
                }
            }
        }
        
        var searchResults: [GeracaoData] {
            if searchText.isEmpty {
                return geracoesData
            } else {
                return geracoesData.filter { $0.tituloData.localizedCaseInsensitiveContains(searchText) }
            }
        }
    }
}
//#Preview {
//    HistoricoView()
//}
