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
    
    let projetos = ["My first APP", "AppStore Challenge", "CLI", "CBL", "MVP challenge"]
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            // Fazer a substituiçao por projeto.titulo e projeto.ferramenta em cor e titulo
            ForEach(geracoesData, id: \.self) { geracao in
                NavigationLink {
                    switch geracao.tipo {
                    case "BrainStorm":
                        TelaBrainStorm(titulo: geracao.tituloData, palavraEntrada: geracao.palavraEntradaData, recorteTematico: geracao.palavraEntradaData, colecaoDeLinhas: geracao.colecaoDeLinhasData, palavrasParaIgnorar: geracao.palavrasParaIgnorarData, palavraGerando: geracao.palavraGerandoData)
                    case "Problemas":
                        ProblemasView(tipo: geracao.tipo, titulo: geracao.tituloData, textoEntrada: geracao.palavraEntradaData, recorteTematico: geracao.palavraEntradaData, colecaoDeTextos: geracao.colecaoDeLinhasData)
                    case "Conexoes":
                        ProblemasView(tipo: geracao.tipo, titulo: geracao.tituloData, textoEntrada: geracao.palavraEntradaData, recorteTematico: geracao.palavraEntradaData, colecaoDeTextos: geracao.colecaoDeLinhasData)
                    default:
                        ProblemasView(tipo: geracao.tipo, titulo: geracao.tituloData, textoEntrada: geracao.palavraEntradaData, recorteTematico: geracao.palavraEntradaData, colecaoDeTextos: geracao.colecaoDeLinhasData)
                    }
                } label: {
                    CardsHistorico(cor: {
                        switch geracao.tipo {
                        case "BrainStorm":
                            "AZUL"
                        case "Problemas":
                            "AMARELO"
                        case "Conexoes":
                            "ROSA"
                        default:
                            "VERMELHO"
                        }
                        
                        
                    }(), texto: "\(geracao.tituloData)", titulo: "\(geracao.palavraGerandoData.texto)")
                        .padding(.bottom, -35)
                }
                .buttonStyle(PlainButtonStyle())
                
            }
            .navigationTitle("Histórico")
            .shadow(radius: 5.6)
            .padding(.top, 20)
            .searchable(text: $searchText, prompt: "Procurando projetos hihihi")
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return projetos
        } else {
            return projetos.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    HistoricoView()
}
