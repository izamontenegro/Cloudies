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
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            ForEach(searchResults, id: \.self) { geracao in
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
                        case "Conex05-8-218oes":
                            "ROSA"
                        default:
                            "VERMELHO"
                        }
                    }(), texto: "\(geracao.palavrasGeradas)", titulo: "\(geracao.tituloData)")
                    .padding(.bottom, -35)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .searchable(text: $searchText, prompt: "Procurar projetos")
            .navigationTitle("Histórico")
            .shadow(radius: 5.6)
            .padding(.top, 20)
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

#Preview {
    HistoricoView()
}
