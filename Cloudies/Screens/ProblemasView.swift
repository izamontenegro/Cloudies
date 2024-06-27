//
//  ProblemasView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 19/06/24.
//

import SwiftUI
import GoogleGenerativeAI
import SwiftData

struct ProblemasView: View {
    @State var gerados: [String] = ["Texto de teste", "Texto de teste", "Texto de teste", "Texto de teste", "Texto de teste"]
    @State var nomeProjeto: String = "Projeto arquitetura"
    @Environment(\.modelContext) var modelContext
    @Query var geracoesData: [GeracaoData]
    
    @Binding var modelo: GeracaoData
    
    @State private var palavraChave: Palavra = Palavra(texto: "")
    @State private var textoGerado: String = ""
    @State private var auxTextosGerados: [Palavra] = []
    @State private var respostaAI: String = ""
    
    @Binding var navigationPath: NavigationPath
    var body: some View {
        ZStack {
            switch modelo.tipo {
            case "Problemas":
                Color.AMARELO
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            case "Conexoes":
                Color.ROSA
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            default:
                Color.VERMELHO
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            
            VStack {
                ZStack(alignment: .top) {
                    Rectangle()
                        .containerRelativeFrame(.vertical, count: 4, spacing: 0)
                        .foregroundStyle(.white)
                        .ignoresSafeArea(edges: [.top])
                    Image("nuvemTopo")
                        .containerRelativeFrame(.horizontal)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text(modelo.palavraEntradaData)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        Text(modelo.recorteTematicoData)
                            .font(.title3)
                            .padding(.horizontal)
                    }
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                ScrollView {
                    ForEach(modelo.colecaoDeLinhasData, id: \.self) { problema in
                        CardGeracaoTexto(titulo: problema.palavras.first!.texto, explicacao: problema.palavras.last!.texto)
                    }
                }
                
                HStack(spacing: 13.51) {
                    Button {
                        Task {
                            palavraChave.texto = modelo.palavraEntradaData
                            respostaAI = await
                            gerarRespostaIgnorandoCasos(gerarParaTela: modelo.tipo, palavraChave: palavraChave, recorteTematico: modelo.recorteTematicoData, ignorando: modelo.palavrasParaIgnorarData)
                            
                            var respostasAI: [String]
                            respostasAI = respostaAI.components(separatedBy: "|")
                            
                            print(respostasAI)
                            for resposta in respostasAI {
                                auxTextosGerados.append(contentsOf: [Palavra(texto: resposta)])
                            }
                            
                            modelo.palavrasParaIgnorarData.append(auxTextosGerados.last!)
                            modelo.colecaoDeLinhasData.append(LinhaDePalavras(palavras: auxTextosGerados))
                            auxTextosGerados.removeAll()
                            print(modelo.colecaoDeLinhasData)
                            
                        }
                    } label: {
                        Botoes(cor: "BRANCO")
                    }
                    
                    Button {
                        //
                    } label: {
                        Botoes(cor: "BRANCO", simbolo: "plus.bubble")
                    }
                }
                .padding(.top, 44)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .toolbar(.hidden, for: .tabBar)
                .toolbar() {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            navigationPath = NavigationPath()
                            
                        } label: {
                            // 4
                            HStack {
                                
                                Image(systemName: "chevron.backward")
                                Text("Voltar")
                            }
                        }
                        
                    }
                }
            }
            
        }
        .navigationTitle(nomeProjeto)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .buttonStyle(PlainButtonStyle())
        }
    
    }

//
//#Preview {
//    ProblemasView(modelo.tipoData: "Conexoes", modelo.tituloData: "oi", modelo.palavraEntrada: "como resolver cachorro", modelo.recorteTematicoData: "passeio")
//}
