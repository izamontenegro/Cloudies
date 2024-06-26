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
    
    @State var tipo: String
    @State var titulo: String
    @State var textoEntrada: String
    @State var recorteTematico: String
    @State var colecaoDeTextos: [LinhaDePalavras] = []
    @State var textosParaIgnorar: [Palavra] = []
    @State var textoGerando: Palavra = Palavra(texto: "")
    @State var colecaoDePalavras: [Palavra] = []
    
    @State private var palavraChave: Palavra = Palavra(texto: "")
    @State private var textoGerado: String = ""
    @State private var auxTextosGerados: [Palavra] = []
    @State private var respostaAI: String = ""
    var body: some View {
        ZStack {
            switch tipo {
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
                            .padding(.trailing, 215)
                            .padding(.bottom, 90)
                    }
                    .padding(.bottom)
                    
                    ScrollView {
                        ForEach(colecaoDeTextos, id: \.self) { problema in
                            CardGeracaoTexto(titulo: problema.palavras.first!.texto, explicacao: problema.palavras.last!.texto)
                        }
                    }
                    
                    HStack(spacing: 13.51) {
                        Button {
                            Task {
                                palavraChave.texto = textoEntrada
                                respostaAI = await
                                gerarRespostaIgnorandoCasos(gerarParaTela: tipo, palavraChave: palavraChave, recorteTematico: recorteTematico, ignorando: textosParaIgnorar)
                                
                                var respostasAI: [String]
                                respostasAI = respostaAI.components(separatedBy: "|")
                                
                                print(respostasAI)
                                for resposta in respostasAI {
                                    auxTextosGerados.append(contentsOf: [Palavra(texto: resposta)])
                                }
                                
                                textosParaIgnorar.append(auxTextosGerados.last!)
                                colecaoDeTextos.append(LinhaDePalavras(palavras: auxTextosGerados))
                                auxTextosGerados.removeAll()
                                print(colecaoDeTextos)
                                
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
                Button {
                    addBrainStorm(
                        tipo: tipo,
                        titulo: titulo,
                        palavraEntrada: textoEntrada,
                        palavraGerando: textoGerando,
                        recorteTematico: recorteTematico,
                        colecaoDeLinhas: colecaoDeTextos,
                        palavrasParaIgnorar: textosParaIgnorar
                    )
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                }
                
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
        .toolbar(.hidden, for: .tabBar)
        .buttonStyle(PlainButtonStyle())
        }
    
    func addBrainStorm(
        tipo: String,
        titulo: String,
        palavraEntrada: String,
        palavraGerando: Palavra,
        recorteTematico: String,
        colecaoDeLinhas: [LinhaDePalavras],
        palavrasParaIgnorar: [Palavra]
    ) {
        
        let problema = GeracaoData(tipo: tipo, palavrasGeradas: recorteTematico, tituloData: titulo, palavraEntradaData: palavraEntrada, palavraGerandoData: palavraGerando, recorteTematicoData: recorteTematico, colecaoDeLinhasData: colecaoDeLinhas, palavrasParaIgnorarData: palavrasParaIgnorar)
        modelContext.insert(problema)
        
    }
    }


#Preview {
    ProblemasView(tipo: "Conexoes", titulo: "oi", textoEntrada: "como resolver cachorro", recorteTematico: "passeio")
}
