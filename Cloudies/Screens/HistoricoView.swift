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
    @State private var navigationPath: NavigationPath = NavigationPath()
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(geracoesData[index])
            }
        }
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
                
                if !searchResults.isEmpty {
                    List {
                        ForEach(searchResults, id: \.self) { geracao in
                            Button {
                                navigationPath.append(geracao.tipo)
                                essaGeracao = geracao
                                print(essaGeracao.palavraEntradaData)
                                navegar = true
                            } label: {
                                CardsHistorico(
                                    ferramenta: geracao.tipo,
                                    texto: "\(geracao.palavraEntradaData)",
                                    titulo: "\(geracao.tituloData)"
                                )
                                
                            }
                            
                            .buttonStyle(PlainButtonStyle())
                            .navigationTitle("Histórico")
                        }
                        .onDelete { indexSet in
                            deleteItems(offsets: indexSet)
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    }
                    
                    .searchable(text: $searchText, prompt: "Procurar projetos")
                    .listStyle(PlainListStyle())
                    .navigationDestination(for: String.self) { name in
                        
                        switch name {
                        case "BrainStorm":
                            TelaBrainStorm(brainstorm: $essaGeracao, navigationPath: $navigationPath)
                        case "Problemas":
                            ProblemasView(modelo: $essaGeracao, navigationPath: $navigationPath)
                        case "Conexoes":
                            ProblemasView(modelo: $essaGeracao, navigationPath: $navigationPath)
                        default:
                            ProblemasView(modelo: $essaGeracao, navigationPath: $navigationPath)
                        }
                    }
                } else {
                    VStack {
                        Image("nuvemProblema")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 290.06)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                        Text("Ainda sem projetos :/")
                            .foregroundStyle(.cinzaCriacao)
                            .font(.title3)
                    }
                    .padding(.top, 190)
                }
            }
        .navigationTitle("Histórico")
        }
    var searchResults: [GeracaoData] {
        if searchText.isEmpty {
            return geracoesData
        } else {
            return geracoesData.filter { $0.tituloData.localizedCaseInsensitiveContains(searchText) }
        }
    }
    }
        
//#Preview {
//    HistoricoView()
//}
