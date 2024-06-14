//
//  GerarPalavras.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/06/24.
//

import GoogleGenerativeAI
import SwiftUI

struct GerarPalavras: View {
    @State private var palavraChave: String = ""
    @State private var palavrasUsadas: [String] = []
    @State private var ultimasPalavrasGeradas: [String] = []
    @State private var geradas: String = ""
    
    var body: some View {
        VStack {
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
            let prompt = 
                """
                Gere 3 soluçoes ja existentes acerca da problematica \(palavraChave)
                As soluçoes devem ter um título e depois uma pequena frase exxplicando, no máximo 15 palavras
                Separe cada cada solução por virgula
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
