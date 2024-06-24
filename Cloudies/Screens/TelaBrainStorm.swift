//
//  Nuvemzinha.swift
//  Cloudies
//
//  Created by Yago Souza Ramos on 10/06/24.
//

import SwiftUI
import GoogleGenerativeAI

struct TelaBrainStorm: View {
    @State var titulo: String
    @State var palavraEntrada: String
    @State var recorteTematico: String
    @State var colecaoDeLinhas: [LinhaDePalavras] = []
    @State var palavrasParaIgnorar: [Palavra] = []
    
    @State private var palavraChave: Palavra = Palavra(texto: "")
    @State private var palavraGerando: Palavra = Palavra(texto: "")
    @State private var palavrasGeradas: String = ""
    @State private var auxPalavrasGeradas: [Palavra] = []
    @State private var respostaAI: String = ""
    @State var colecaoDePalavras: [Palavra] = []
    
    @State private var observador: Bool = false
        var body: some View {
            VStack {
                Button(action: {
                    botaoNuvem()
                    
                }, label: {
                    ZStack {
                        Image("NuvemTituloAzul")
                        Text("\(palavraGerando.texto != "" ? palavraGerando.texto : "\(palavraEntrada)")")
                            .foregroundStyle(.black)
                    }
                }).onChange(of: observador, botaoNuvem)
                
                .padding(50)
                ScrollView(.vertical) {
                    ForEach($colecaoDeLinhas) { colecao in
                        LinhaDePalavrasView(palavras: colecao.palavras, linhas: $colecaoDeLinhas, observador: $observador)
                    }
                }
                .defaultScrollAnchor(.bottom)
                Spacer()
                HStack {
                    ZStack {
                        Button(action: {
                            // Codigo de Favoritos
                        }, label: {
                            ZStack {
                                Botoes(cor: "AZUL")
                                Text("Favoritos")
                                    .foregroundStyle(.black)
                            }
                        })
                    }
                    ZStack {
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                Botoes(cor: "AZUL")
                                Text("Favoritos")
                                    .foregroundStyle(.black)
                            }
                        })
                    }
                    
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        addBrainStorm(
                            titulo: titulo,
                            palavraEntrada: palavraEntrada,
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
            .navigationBarTitleDisplayMode(.inline)
            
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
        recorteTematico: String,
        colecaoDeLinhas: [LinhaDePalavras],
        palavrasParaIgnorar: [Palavra]
    ) {
        
    }
}

#Preview {
    NavigationStack {
        TelaBrainStorm(titulo: "codigo", palavraEntrada: "pneumoultramicroscopicosilicovulcanoconiotico", recorteTematico: "Outras palavras Longas")
    }
}
