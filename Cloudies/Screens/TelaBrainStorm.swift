//
//  Nuvemzinha.swift
//  Cloudies
//
//  Created by Yago Souza Ramos on 10/06/24.
//

import SwiftUI
import GoogleGenerativeAI

struct TelaBrainStorm: View {
    @State private var palavraChave: Palavra = Palavra(texto: "")
    @State private var palavraEntrada: String = "prompt"
    @State private var palavraGerando: Palavra = Palavra(texto: "")
    @State private var palavrasGeradas: String = ""
    @State private var palavrasParaIgnorar: [Palavra] = []
    @State private var auxPalavrasGeradas: [Palavra] = []
    @State private var respostaAI: String = ""
    @State
    var colecaoDePalavras: [Palavra] = []
    
    @State
    var colecaoDeLinhas: [LinhaDePalavras] = []
    
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    
                    var indexChaveI: Int = -1
                    var indexChaveJ: Int = -1
                    var parar = false
                    for i in 0..<colecaoDeLinhas.count {
                        print("i: " + String(i))
                        for j in 0..<colecaoDeLinhas[i].palavras.count {
                            print("j: " + String(j))
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
                            
                            if (parar == true) {
                                break
                            }
                        }
                        if (parar == true) {
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
                    
                    respostaAI = await gerarRespostaIgnorandoCasos(gerarParaTela: "BrainStorm", palavraChave: palavraChave, ignorando: palavrasParaIgnorar)
                    
                    auxPalavrasGeradas = separarRespostaBrainStorm(respostasAI: respostaAI)
                    palavrasParaIgnorar.append(contentsOf: auxPalavrasGeradas)
                    
                    palavraChave.texto = ""
                    
                    colecaoDeLinhas.append(LinhaDePalavras(palavras: auxPalavrasGeradas))
                    //salvar colelção de linhas com swiftdata
                    
                    auxPalavrasGeradas.removeAll()
                }
            }, label: {
                ZStack {
                    Image("NuvemTituloAzul")
                    Text("\(palavraGerando.texto != "" ? palavraGerando.texto : "")")
                        .foregroundStyle(.black)
                }
            })
            .padding(50)
            ForEach($colecaoDeLinhas) { colecao in
                LinhaDePalavrasView(palavras: colecao.palavras, linhas: $colecaoDeLinhas)
            }
            Spacer()
            
        }
        .navigationBarTitle("\(palavraEntrada)")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    func separarRespostaBrainStorm(respostasAI: String) -> [Palavra] {
        let respostasAI: [String] = respostaAI.components(separatedBy: ", ")
        
        for resposta in respostasAI {
            auxPalavrasGeradas.append(contentsOf: [Palavra(texto: resposta)])
        }
        
        return auxPalavrasGeradas
    }

}
#Preview {
    NavigationStack {
        TelaBrainStorm()
    }}
