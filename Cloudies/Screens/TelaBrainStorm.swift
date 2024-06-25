//
//  Nuvemzinha.swift
//  Cloudies
//
//  Created by Yago Souza Ramos on 10/06/24.
//

import SwiftUI
import GoogleGenerativeAI
import SwiftData

struct TelaBrainStorm: View {
    @Environment(\.modelContext) var modelContext
    @Query var geracoesData: [GeracaoData]
    
    @State var titulo: String
    @State var palavraEntrada: String
    @State var recorteTematico: String
    @State var colecaoDeLinhas: [LinhaDePalavras] = []
    @State var palavrasParaIgnorar: [Palavra] = []
    @State var palavraGerando: Palavra = Palavra(texto: "")
    
    @State private var palavraChave: Palavra = Palavra(texto: "")
    @State private var palavrasGeradas: String = ""
    @State private var auxPalavrasGeradas: [Palavra] = []
    @State private var respostaAI: String = ""
    @State var colecaoDePalavras: [Palavra] = []
    
    @State private var observador: Bool = false
    
    var body: some View {
        ZStack {
            Color.AZUL
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(height: 200)
                        .foregroundStyle(.white)
                        .padding(.top, -250)
                    Image("nuvemTopo")
                        .padding(.leading, 110)
                        .padding(.top, -60)
                    Text(palavraEntrada)
                        .font(.title3)
                        .padding(.leading, -180)
                        .padding(.bottom, 90)
                }
                .padding(.bottom)
                
                ScrollView(.vertical) {
                    ForEach($colecaoDeLinhas) { colecao in
                        LinhaDePalavrasView(palavras: colecao.palavras, linhas: $colecaoDeLinhas, observador: $observador)
                    }
                    
                    .padding()
                }
                .defaultScrollAnchor(.bottom)
                
                Spacer()
                HStack(spacing: 13.51) {
                    Button(action: {
                        botaoNuvem()
                        
                    }, label: {
                        Botoes(cor: "BRANCO")
                    }).onChange(of: observador, botaoNuvem)
                    
                    Button {
                        //
                    } label: {
                        Botoes(cor: "BRANCO", simbolo: "plus.bubble")
                    }
                }
            }
            
        }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        addBrainStorm(
                            titulo: titulo,
                            palavraEntrada: palavraEntrada,
                            palavraGerando: palavraGerando,
                            recorteTematico: recorteTematico,
                            colecaoDeLinhas: colecaoDeLinhas,
                            palavrasParaIgnorar: palavrasParaIgnorar
                        )
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                    }
                    
                }
            }
            .navigationBarTitle("\(titulo)")
            .navigationBarTitleDisplayMode(.large)
            
        }
        func botaoNuvem() {
            
            Task {
                
                var indexChaveI: Int = -1
                var indexChaveJ: Int = -1
                var parar = false
                for i in 0..<colecaoDeLinhas.count {
                    
                    for j in 0..<colecaoDeLinhas[i].palavras.count {
                        
                        if colecaoDeLinhas[i].palavras[j].isGeneration == true {
                            indexChaveI = i
                            indexChaveJ = j
                            print(i)
                            print(j)
                            palavraGerando = colecaoDeLinhas[i].palavras[j]
                            colecaoDeLinhas[i].palavras[j].isGeneration.toggle()
                            parar = true
                            break
                            
                        }
                        
                        if parar == true {
                            break
                        }
                    }
                    if parar == true {
                        break
                    }
                }
                if (indexChaveI == -1 || indexChaveJ == -1) && palavraGerando.texto == "" {
                    palavraChave.texto = palavraEntrada
                    
                } else {
                    palavraChave.texto = palavraGerando.texto
                    print(palavraGerando.texto)
                }
                print(palavraChave.texto)
                
                respostaAI = await gerarRespostaIgnorandoCasos(gerarParaTela: "BrainStorm", palavraChave: palavraChave, recorteTematico: recorteTematico, ignorando: palavrasParaIgnorar)
                
                auxPalavrasGeradas = separarRespostaBrainStorm(respostasAI: respostaAI)
                
                for i in auxPalavrasGeradas.indices {
                    auxPalavrasGeradas[i].texto = auxPalavrasGeradas[i].texto.replacingOccurrences(of: "\n", with: "")
                }
                palavrasParaIgnorar.append(contentsOf: auxPalavrasGeradas)
                
                palavraChave.texto = ""
                
                colecaoDeLinhas.append(LinhaDePalavras(palavras: auxPalavrasGeradas))
                //salvar colelção de linhas com swiftdata
                auxPalavrasGeradas.removeAll()
            }
            
            @Sendable func separarRespostaBrainStorm(respostasAI: String) -> [Palavra] {
                let respostasAI: [String] = respostaAI.components(separatedBy: ", ")
                
                for resposta in respostasAI {
                    auxPalavrasGeradas.append(contentsOf: [Palavra(texto: resposta)])
                }
                
                return auxPalavrasGeradas
            }
            
        }
        
        func addBrainStorm(
            titulo: String,
            palavraEntrada: String,
            palavraGerando: Palavra,
            recorteTematico: String,
            colecaoDeLinhas: [LinhaDePalavras],
            palavrasParaIgnorar: [Palavra]
        ) {
            
            let brainstorm = GeracaoData(tituloData: titulo, palavraEntradaData: palavraEntrada, palavraGerandoData: palavraGerando, recorteTematicoData: recorteTematico, colecaoDeLinhasData: colecaoDeLinhas, palavrasParaIgnorarData: palavrasParaIgnorar)
            modelContext.insert(brainstorm)
            
        }
}

#Preview {
        TelaBrainStorm(titulo: "Projeto animal", palavraEntrada: "Cachorro", recorteTematico: "doméstico")
}
