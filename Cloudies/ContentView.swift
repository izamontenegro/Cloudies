//
//  ContentView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 11/06/24.
//

import GoogleGenerativeAI
import SwiftUI

struct ContentView: View {
    @State private var palavraChave: String = ""
    @State private var palavrasUsadas: [String] = []
    @State private var ultimasPalavrasGeradas: [String] = []
    @State private var geradas: String = ""
    
    var body: some View {
        VStack{
            HStack {
                TextField("Digite palavras-chave", text: $palavraChave)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    Task {
                        geradas = await gerarPalavras(palavraChave: palavraChave, palavrasUsadas: palavrasUsadas)
                        ultimasPalavrasGeradas = geradas.components(separatedBy: ", ")
                        ultimasPalavrasGeradas[ultimasPalavrasGeradas.count-1] = ultimasPalavrasGeradas[ultimasPalavrasGeradas.count-1].replacingOccurrences(of: "\n", with: "")
                        palavrasUsadas.append(contentsOf: ultimasPalavrasGeradas)
                        palavraChave = " "
                        
                    }
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
            }
            
            Text("\(ultimasPalavrasGeradas)")
        }
    }
    

    func gerarPalavras(palavraChave: String, palavrasUsadas: [String]) async -> String {
        
            do {
                let prompt = """
"- Gere 2 objetos físicos relacionados à palavra "\(palavraChave)".

- Gere 3 conceitos abstratos relacionados à palavra "\(palavraChave)".

- Gere-as uma seguida da outra, separadas apenas por vírgula, não use quebra de linha

- Não inclua as seguintes palavras: \(palavrasUsadas)
"""
                
                let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: "AIzaSyAXRUjeuLPw_w7SvkvpkcScmF5QR29l9kU")
                
                print(prompt)
                let response = try await model.generateContent(prompt)
                if let text = response.text {
                    let textSemEspaco = text.replacingOccurrences(of: "\n", with: "")
                    return text
                }
                else {
                    return "kkk"
                }
            } catch {
                print("Erro ao gerar conteúdo: \(error)")
                return "kkk"
            }
            
            
        
    }
}

#Preview {
    ContentView()
}
