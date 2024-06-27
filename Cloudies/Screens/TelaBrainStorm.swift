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
    
    @Binding var navigationPath: NavigationPath
    
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
                    
                    VStack {
                        Text(brainstorm.palavraEntradaData)
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.leading, -180)
                            .padding(.top, 20)
                        Text(palavrasDeGeracao)
                            .font(.title3)
                            .padding(.leading, -180)
                            .padding(.bottom, 90)
                    }
                    
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
        .navigationBarTitle("\(brainstorm.tituloData)")
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
