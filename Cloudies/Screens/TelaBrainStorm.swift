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
    @State var palavrasDeGeracao: String = ""
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
                ZStack(alignment: .top) {
                    Rectangle()
                        .containerRelativeFrame(.vertical, count: 4, spacing: 0)
                        .foregroundStyle(.white)
                        .ignoresSafeArea(edges: [.top])
                    Image("nuvemTopo")
                        .containerRelativeFrame(.horizontal)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text(palavraEntrada)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        Text(palavraEntrada + palavrasDeGeracao)
                            .font(.title3)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                ScrollView(.vertical) {
                    ForEach($colecaoDeLinhas) { colecao in
                        LinhaDePalavrasView(palavras: colecao.palavras, linhas: $colecaoDeLinhas, observador: $observador)
                    }
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
                .padding(.top, 20)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    addBrainStorm(
                        titulo: titulo,
                        palavraEntrada: palavraEntrada,
                        palavrasGeradas: palavrasDeGeracao,
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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        
    }
    func botaoNuvem() {
        
        Task {
            
            var indexChaveI: Int = -1
            var indexChaveJ: Int = -1
            var parar = false
            var pontinhos: Bool = true
            for i in 0..<colecaoDeLinhas.count {
                
                for j in 0..<colecaoDeLinhas[i].palavras.count {
                    
                    if colecaoDeLinhas[i].palavras[j].isGeneration == true {
                        indexChaveI = i
                        indexChaveJ = j
                        print(i)
                        print(j)
                        palavraGerando = colecaoDeLinhas[i].palavras[j]
                        if palavrasDeGeracao.count < 60 {
                            palavrasDeGeracao += ", \(palavraGerando.texto)"
                        }
                        else {
                            if pontinhos {
                                palavrasDeGeracao += "..."
                                pontinhos = false
                            }
                        }
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
        palavrasGeradas: String,
        palavraGerando: Palavra,
        recorteTematico: String,
        colecaoDeLinhas: [LinhaDePalavras],
        palavrasParaIgnorar: [Palavra]
    ) {
        
        let brainstorm = GeracaoData(tipo: "BrainStorm", palavrasGeradas: palavrasGeradas, tituloData: titulo, palavraEntradaData: palavraEntrada, palavraGerandoData: palavraGerando, recorteTematicoData: recorteTematico, colecaoDeLinhasData: colecaoDeLinhas, palavrasParaIgnorarData: palavrasParaIgnorar)
        modelContext.insert(brainstorm)
        
    }
    
}

#Preview {
    NavigationStack {
        TelaBrainStorm(titulo: "Projeto animal", palavraEntrada: "Cachorro", recorteTematico: "doméstico")
    }
}
