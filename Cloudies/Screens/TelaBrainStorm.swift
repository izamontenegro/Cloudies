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
    //@Query var geracoesData: [GeracaoData]
    
    @Binding var brainstorm: GeracaoData
    
    @State private var palavraChave: Palavra = Palavra(texto: "")
    @State private var palavrasGeradas: String = ""
    @State private var auxPalavrasGeradas: [Palavra] = []
    @State private var respostaAI: String = ""
    @State var colecaoDePalavras: [Palavra] = []
    @State var palavrasDeGeracao: String = ""
    @State private var observador: Bool = false
    @State private var isClicavel = false
    
    @State private var isTyping: Bool = false
    @Binding var navigationPath: NavigationPath
    
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
                        Text(brainstorm.palavraEntradaData)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        Text(brainstorm.palavraGerandoData.texto)
                            .font(.title3)
                            .padding(.horizontal)
                    }
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                ScrollView(.vertical) {
                    ForEach($brainstorm.colecaoDeLinhasData) { colecao in
                        LinhaDePalavrasView(palavras: colecao.palavras, linhas: $brainstorm.colecaoDeLinhasData, observador: $observador)
                    }
                }
                .defaultScrollAnchor(.bottom)
                
                Spacer()
                HStack(spacing: 13.51) {
                    Button(action: {
                        botaoNuvem()
                        isClicavel = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            isClicavel = false
                        }
                    }, label: {
                        Botoes(texto: "Gerar")
                    }).onChange(of: observador, botaoNuvem)
                        .disabled(isClicavel)
                    
                    Button {
                        isTyping.toggle()
                    } label: {
                        Botoes(simbolo: "plus.bubble", texto: "Adicionar")
                    }
                    .sheet(isPresented: $isTyping) {
                        
                        SheetAdicionarPalavras(linhaGeracao: $brainstorm.colecaoDeLinhasData)
                    }
                }
                .padding(.top, 20)
            }
            
        }
        .navigationBarTitle("\(brainstorm.tituloData)")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
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
    func botaoNuvem() {
        
        Task {
            
            var indexChaveI: Int = -1
            var indexChaveJ: Int = -1
            var parar = false
            for i in 0..<$brainstorm.colecaoDeLinhasData.count {
                
                for j in 0..<$brainstorm.colecaoDeLinhasData[i].palavras.count {
                    
                    if brainstorm.colecaoDeLinhasData[i].palavras[j].isGeneration == true {
                        indexChaveI = i
                        indexChaveJ = j
                        print(i)
                        print(j)
                        brainstorm.palavraGerandoData = brainstorm.colecaoDeLinhasData[i].palavras[j]
                        palavrasDeGeracao += ", \(brainstorm.palavraGerandoData.texto)"
                        brainstorm.colecaoDeLinhasData[i].palavras[j].isGeneration.toggle()
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
            if (indexChaveI == -1 || indexChaveJ == -1) && brainstorm.palavraGerandoData.texto == "" {
                palavraChave.texto = brainstorm.palavraEntradaData
                
            } else {
                palavraChave.texto = brainstorm.palavraGerandoData.texto
                print(brainstorm.palavraGerandoData.texto)
            }
            print(palavraChave.texto)
            
            respostaAI = await gerarRespostaIgnorandoCasos(gerarParaTela: "BrainStorm", palavraChave: palavraChave, recorteTematico: brainstorm.recorteTematicoData, ignorando: brainstorm.palavrasParaIgnorarData)
            
            auxPalavrasGeradas = separarRespostaBrainStorm(respostasAI: respostaAI)
            
            for i in auxPalavrasGeradas.indices {
                auxPalavrasGeradas[i].texto = auxPalavrasGeradas[i].texto.replacingOccurrences(of: "\n", with: "")
            }
            brainstorm.palavrasParaIgnorarData.append(contentsOf: auxPalavrasGeradas)
            
            palavraChave.texto = ""
            
            brainstorm.colecaoDeLinhasData.append(LinhaDePalavras(palavras: auxPalavrasGeradas))
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
    
}

//#Preview {
//        TelaBrainStorm($brainstom.tituloData: "Projeto animal", $brainstorm.palavraEntradaData: "Cachorro", brainstorm.recorteTematicoData: "doméstico")
//}
