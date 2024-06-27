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
                    ZStack {
                        Rectangle()
                            .frame(height: 200)
                            .foregroundStyle(.white)
                            .padding(.top, -250)
                        Image("nuvemTopo")
                            .padding(.leading, 110)
                            .padding(.top, -60)
                        Text("texto palavrinha")
                            .font(.title3)
                            .padding(.trailing, 200)
                            .padding(.bottom, 90)
                    }
                    .padding(.bottom)
                    
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
                    
                }
                
            }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    print("")
                }, label: {
                    Image(systemName: "pencil.circle")
                        .imageScale(.medium)
                        .scaleEffect(1.1)
                })
            }
        }
        .navigationTitle(nomeProjeto)
        .navigationBarTitleDisplayMode(.large)
        .buttonStyle(PlainButtonStyle())
        }
    
    }

//
//#Preview {
//    ProblemasView(modelo.tipoData: "Conexoes", modelo.tituloData: "oi", modelo.palavraEntrada: "como resolver cachorro", modelo.recorteTematicoData: "passeio")
//}
