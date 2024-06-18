//
//  GerarPalavras.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/06/24.
//
/*
import GoogleGenerativeAI
import SwiftUI

struct GerarPalavras: View {
    @State private var palavraChave: Palavra = Palavra(texto: "")
    @State private var palavraEntrada: String = ""
    @State private var palavrasGeradas: String = ""
    @State private var palavrasUsadas: [Palavra] = []
    @State private var ultimaColecaoDePalavras: [Palavra] = []
    @State private var respostaAI: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Digite palavras-chave", text: $palavraEntrada)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    Task {
                        palavraChave.texto = palavraEntrada
                        respostaAI = await gerarPalavras(palavraChave: palavraChave, palavrasUsadas: palavrasUsadas)

                        var respostaAISeparada: [String] = respostaAI.components(separatedBy: ", ")
                        
                        for palavraAI in respostaAISeparada {
                            ultimaColecaoDePalavras.append(contentsOf: [Palavra(texto: palavraAI)])
                        }

                        palavrasUsadas.append(contentsOf: ultimaColecaoDePalavras)

                        palavraChave.texto = ""
                    }
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
            }
            
            Text("\(palavrasGeradas)")
        }
    }

    func gerarPalavras(palavraChave: Palavra, palavrasUsadas: [Palavra]) async -> String {
        
        var palavrasUsadasPrompt = ""
        for palavra in palavrasUsadas {
            palavrasUsadasPrompt += ", \(palavra.texto)"
        }
        
        do {
            
            let prompt =
            """
            - Gere 2 objetos físicos relacionados à palavra "\(palavraChave.texto)".
            - Gere 3 conceitos abstratos relacionados à palavra "\(palavraChave.texto)".
            - Gere-as uma seguida da outra, separadas apenas por vírgula, não use quebra de linha
            - Não inclua as seguintes palavras: \(palavrasUsadasPrompt)
            """

            let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: "AIzaSyAXRUjeuLPw_w7SvkvpkcScmF5QR29l9kU")

            print(prompt)
            let response = try await model.generateContent(prompt)
            if let text = response.text {
                _ = text.replacingOccurrences(of: "\n", with: "")
                return text
            } else {
                return "kkk"
            }
        } catch {
            print("Erro ao gerar conteúdo: \(error)")
            return "kkk"
        }
    }
}

#Preview {
    GerarPalavras()
}
*/
