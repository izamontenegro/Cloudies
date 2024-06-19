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
                    respostaAI = await gerarRespostaAI(tipoGeracao: "BrainStorm", palavraChave: palavraChave, palavrasUsadas: palavrasParaIgnorar)
                    
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
    func gerarRespostaAI(tipoGeracao: String, palavraChave: Palavra, palavrasUsadas: [Palavra]) async -> String {
        
        var palavrasUsadasPrompt = ""
        var prompt = ""
        for palavra in palavrasUsadas {
            palavrasUsadasPrompt += ", \(palavra.texto)"
        } //Transforma as palavras usadas em uma string para passar para a ia
        
        do {
            
            switch tipoGeracao {
            case "BrainStorm":
                prompt =
                """
                - Gere 2 objetos físicos relacionados à palavra "\(palavraChave.texto)".
                - Gere 3 conceitos abstratos relacionados à palavra "\(palavraChave.texto)".
                - Gere-as uma seguida da outra, separadas apenas por vírgula, não use quebra de linha
                - Gere apenas palavras, nada de frases
                - Não inclua as seguintes palavras: \(palavrasUsadasPrompt)
                """
            case "Problematicas":
                prompt = 
                ""//Prompt de problematica aqui
                
            case "Analogias":
                prompt = 
                ""//Prompt de analogia aqui
            default:
                prompt =
                "Retorne 'Erro: tipo de geração inválido'"
            }
            
            let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: "AIzaSyAXRUjeuLPw_w7SvkvpkcScmF5QR29l9kU")
            
            print(prompt)
            let response = try await model.generateContent(prompt)
            if let text = response.text {
                _ = text.replacingOccurrences(of: "\n", with: "")
                return text
            } else {
                return "kkk" //Retornar o erro
            }
        } catch {
            print("Erro ao gerar conteúdo: \(error)")
            return "kkk" //Inserir mensagem de erro
        }
    }

}

#Preview {
    TelaBrainStorm()
}
