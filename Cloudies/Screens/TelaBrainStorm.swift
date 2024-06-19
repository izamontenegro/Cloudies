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
    @State private var palavraEntrada: String = ""
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
                    palavraEntrada = "prompt"
                    palavraChave.texto = palavraEntrada
                    respostaAI = await gerarRespostaIgnorandoCasos(gerarParaTela: "BrainStorm", palavraChave: palavraChave, ignorando: palavrasParaIgnorar)
                    
                    auxPalavrasGeradas = separarRespostaBrainStorm(respostasAI: respostaAI)
                    palavrasParaIgnorar.append(contentsOf: auxPalavrasGeradas)
                    
                    palavraChave.texto = ""
                    
                    colecaoDeLinhas.append(LinhaDePalavras(palavras: auxPalavrasGeradas))
                    //salvar colelção de linhas com swiftdata
                    
                    auxPalavrasGeradas.removeAll()
                }
            }, label: {
                Image(systemName: "plus.circle.fill")
            })
            .padding(50)
            Spacer()
            ForEach($colecaoDeLinhas) { colecao in
                LinhaDePalavrasView(palavras: colecao.palavras, linhas: $colecaoDeLinhas)
            }
            Spacer()
            
        }
        
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
    TelaBrainStorm()
}
